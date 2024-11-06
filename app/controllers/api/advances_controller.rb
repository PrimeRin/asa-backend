# frozen_string_literal: true

module Api
  class AdvancesController < ApplicationController
    include UrlHelper
    before_action :authenticate_user!
    before_action :set_advance, only: %i[show update update_status claim_dsa]
    before_action :check_existing_advances, only: [:create]

    def index
      items = params[:per_page] || 10
      @pagy, @advances = pagy(AdvanceQuery.call(params[:advance], current_user, Advance.all),
                              page: params[:page] || 1, items: items)
      @advances = @advances.map do |advance|
        advance.attributes.merge(
          user: {
            username: advance.user.username,
            email: advance.user.email,
            name: advance.name,
            profile_pic: ProfileService.new(advance.user.username).profile
          })
      end
      render json: { pagy: pagy_metadata(@pagy), advances: @advances }, status: :ok
    end

    def show
      @advance = @advance.attributes.merge(
        user: @advance.user,
        position_title: @advance.position,
        advance_detail: @advance.salary_advance,
        travel_itinerary: travel_itineraries,
        files: serialize_files(files)
      )
      render json: @advance, status: :ok
    end

    def status_counts
      status_count = calculate_status_count
      render json: { status_count: status_count }, status: :ok
    end

    def type_counts
      advance_type_count = calculate_type_count
      render json: { advance_type_count: advance_type_count }, status: :ok
    end

    def update_status
      @advance = AdvanceUpdateQuery.call(params, current_user, @advance)
      PublishNotificationService.new(current_user, @advance).update
      render json: { advance: @advance }, status: :ok
    end

    def monthly_counts
      monthly_data = Advance.select("DATE_FORMAT(created_at, '%Y-%m-01') as month, COUNT(*) as count")
                            .group("DATE_FORMAT(created_at, '%Y-%m-01')")
                            .order(Arel.sql("DATE_FORMAT(created_at, '%Y-%m-01') ASC"))

      formatted_data = monthly_data.map do |record|
        {
          month: Date.parse(record.month).strftime('%B %Y'),
          count: record.count
        }
      end

      render json: formatted_data, status: :ok
    end

    def create
      unless advance_params[:advance_type] != 'salary_advance' || check_salary_advance
        return render json: { status: :conflict, message: 'You already have an existing advance which needs to be closed.' }, status: :conflict
      end

      @advance = current_user.advances.new(advance_params)

      if @advance.save
        create_salary_advance if @advance.advance_type === 'salary_advance'
        create_itinerary if itinerary_needed?
        PublishNotificationService.new(current_user, @advance).create
        render json: @advance, status: :created
      else
        render json: @advance.errors, status: :unprocessable_entity
      end
    end

    def update
      if @advance.update(advance_params.merge(status: "pending"))
        update_salary_advance if @advance.advance_type === 'salary_advance'
        update_itinerary if itinerary_needed?
        render json: @advance, status: :ok
      else
        render json: @advance.errors, status: :unprocessable_entity
      end
    end

    def update
      if @advance.status.in?(["pending", "rejected"])
        if @advance.update(advance_params.merge(status: "pending"))
          update_salary_advance if @advance.advance_type == 'salary_advance'
          update_itinerary if itinerary_needed?
          render json: @advance, status: :ok
        else
          render json: @advance.errors, status: :unprocessable_entity
        end
      else
        render json: { error: "Invalid status for updation" }, status: :unprocessable_entity
      end
    end

    def claim_dsa
      new_advance = @advance.dup
      dsa_type = case @advance.advance_type
                 when 'in_country_tour_advance'
                   'in_country_dsa_claim'
                 when 'ex_country_tour_advance'
                   'ex_country_dsa_claim'
                 end
      new_advance.assign_attributes(
        claim_dsa: true,
        status: 'pending',
        advance_type: dsa_type,
        dsa_amount: params[:dsa_amount],
        parent_id: @advance.id,
      )
      @advance.update!(status: "closed")

      if new_advance.save
        PublishNotificationService.new(current_user, new_advance).create
        render json: new_advance, status: :ok
      else
        render json: new_advance.errors, status: :unprocessable_entity
      end
    end

    private

    def check_existing_advances
      existing_advance = current_user.advances.where(
        advance_type: params[:advance][:advance_type],
        status: %w[pending verified confirmed]
      ).exists?

      if existing_advance
        return render json: { status: :conflict, message: 'You already have an existing advance which needs to close.' }, status: :conflict
      end


      unsettled_advance_types = ['in_country_tour_advance', 'ex_country_tour_advance']
      if unsettled_advance_types.include?(params[:advance][:advance_type])
        advance_not_closed_user_ids = Advance.where(
          advance_type: unsettled_advance_types,
          status: 'dispatched'
        ).pluck(:user_id)
    
        if advance_not_closed_user_ids.include?(current_user.id)
          return render json: { status: :conflict, message: 'You already have an existing tour advance that needs to be settled. Please submit DSA claim to settle the advance.' }, status: :conflict
        end
      end                                     
    end

    def update_itinerary
      ItineraryService.new(@advance, travel_itinerary_params).update
    end

    def update_files
      @advance.files.attach(params[:files][:files])
    end

    def travel_itinerary_params
      params.require(:travel_itinerary).map do |itinerary|
        itinerary.permit(
          :start_date,
          :end_date,
          :from,
          :to,
          :rate,
          :from_place,
          :to_place,
          :dsa_percentage,
          :halt_at,
          :mileage,
          :mode,
          :days,
          :stop_at,
          :currency,
          :return
        )
      end
    end

    def salary_params
      params.require(:salary_advance).permit(:duration, :deduction, :completion_month, :status)
    end

    def create_itinerary
      ItineraryService.new(@advance, travel_itinerary_params).create
    end

    def create_salary_advance
      SalaryService.new(@advance, salary_params).create
    end

    def update_salary_advance
      SalaryService.new(@advance, salary_params).update
    end

    def set_advance
      @advance = Advance.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Advance not found' }, status: :not_found
    end

    def itinerary_needed?
      %w[in_country_tour_advance ex_country_tour_advance].include?(@advance.advance_type)
    end

    def advance_params
      params.require(:advance).permit(
        :advance_type,
        :status,
        :amount,
        :purpose,
        :remark,
        :office_order,
        :tour_type,
        :advance_percentage,
        :additional_expense,
        dsa_amount: [:Nu, :INR, :USD],
        advance_amount: [:Nu, :INR, :USD]
      )
    end

    def check_salary_advance
      salary_advance = previous_balance(current_user.username, '1302004')

      if salary_advance > 0
        return false
      end

      true
    end

    def previous_balance(slcode, glcode)
      Icbs::BalanceFetcher.fetch_balance(slcode, glcode)
    end

    def calculate_status_count
      Advance.group(:status).count
    end

    def calculate_type_count
      Advance.group(:advance_type).count
    end

    def travel_itineraries
      if @advance.advance_type == 'in_country_dsa_claim' || @advance.advance_type == 'ex_country_dsa_claim'
        advance = Advance.find(@advance.parent_id)
        advance.travel_itineraries
      else
        @advance.travel_itineraries
      end
    end

    def files
      if @advance.advance_type == 'in_country_dsa_claim' || @advance.advance_type == 'ex_country_dsa_claim'
        advance = Advance.find(@advance.parent_id)
        advance.files
      else
        @advance.files
      end
    end
  end
end
