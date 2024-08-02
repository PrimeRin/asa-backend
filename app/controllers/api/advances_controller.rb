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
        travel_itinerary: @advance.travel_itineraries,
        files: serialize_files(@advance.files)
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
      if @advance.update(advance_params)
        update_itinerary if itinerary_needed?
        update_files if files_attached?
        render json: @advance, status: :ok
      else
        render json: @advance.errors, status: :unprocessable_entity
      end
    end

    def claim_dsa
      if @advance.update(claim_dsa: true, status: "pending", dsa_amount: params[:dsa_amount])
        PublishNotificationService.new(current_user, @advance).create
        render json: @advance, status: :ok
      else
        render json: @advance.errors, status: :unprocessable_entity
      end
    end

    private

    def check_existing_advances
      existing_advance = current_user.advances.where(status: ['pending', 'verified', 'confirmed']).exists?

      if existing_advance
        render json: { status: :conflict, message: 'You already have an existing advance which is needs to close.' }, status: :conflict
      end
    end

    def update_itinerary
      @advance.travel_itineraries.update(travel_itinerary_params)
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
          :dsa_percentage,
          :halt_at,
          :mileage,
          :mode,
          :days,
          :currency
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
        :advance_percentage,
        dsa_amount: [:Nu, :INR, :USD],
        advance_amount: [:Nu, :INR, :USD]
      )
    end

    def calculate_status_count
      Advance.group(:status).count
    end

    def calculate_type_count
      Advance.group(:advance_type).count
    end
  end
end
