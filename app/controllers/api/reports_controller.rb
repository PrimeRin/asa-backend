module Api
  class ReportsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_advance, only: %i[index]
    before_action :get_advance, only: %i[show]

    def index
      case reports_params[:report_type]
      when "individual"
        generate_individual_report
      when "all"
        generate_all_reports
      end
      total = calculate_total_amount
      if @advances.empty?
        message = "There are no advances for this employee."
      else
        @advances = @advances.map do |advance|
          advance.attributes.merge(
            user: {
              username: advance.user.username,
              email: advance.user.email,
              department: advance.user.department,
              name: advance.name,
            })
        end
        message = nil
      end
      render json: { advances: @advances, total: total, message: message  }, status: :ok
    end

    def show
      report = ReportService.new(@advance).create
      render json: { report: report }, status: :ok
    end

    private

    def generate_individual_report
      filters = {}

      if reports_params[:advance_type]  == 'dsa_claim'
        return dsa_report
      end

      if reports_params[:advance_type] && reports_params[:advance_type] != 'all'
        filters[:advance_type] = reports_params[:advance_type]
      end

      user = User.find_by(username: reports_params[:employee_id])

      if user.nil?
        @advances = Advance.none
        return
      end

      @advances = @advances.where(user_id: user.id)
      @advances = @advances.where(filters) if filters.any?
    end

    def dsa_report
      user = User.find_by(username: reports_params[:employee_id])

      if user.nil?
        @advances = Advance.none
        return
      end
      @advances = @advances.where(user_id: user.id, claim_dsa: true)
    end

    def calculate_total_amount
      total = { Nu: 0, INR: 0, USD: 0 }

      @advances.each do |advance|
        case advance.advance_type
        when 'salary_advance', 'other_advance'
          total[:Nu] += advance.amount
        when 'in_country_tour_advance'
          total[:Nu] += advance.advance_amount['Nu']
          total[:Nu] += advance.dsa_amount['Nu'] if advance.claim_dsa
        when 'ex_country_tour_advance'
          total[:Nu] += advance.advance_amount['Nu']
          total[:INR] += advance.advance_amount['INR']
          total[:USD] += advance.advance_amount['USD']
          if advance.claim_dsa
            total[:Nu] += advance.dsa_amount['Nu']
            total[:INR] += advance.dsa_amount['INR']
            total[:USD] += advance.dsa_amount['USD']
          end
        end
      end

      total
    end

    def generate_all_reports
      filters = {}

      if reports_params[:advance_type] && reports_params[:advance_type] != 'all'
        filters[:advance_type] = reports_params[:advance_type]
      end

      if reports_params[:department] && reports_params[:department] != 'all'
        user_ids = User.where(department: reports_params[:department]).pluck(:id)
        filters[:user_id] = user_ids
      end

      @advances = @advances.where(filters) if filters.any?
    end

    def set_advance
      start_date = Date.parse(reports_params[:start_date]) rescue nil
      end_date = Date.parse(reports_params[:end_date]) rescue nil
      if start_date && end_date
        @advances = Advance.where(
          status: %w[dispatched closed],
          updated_at: start_date.beginning_of_day..end_date.end_of_day
        )
      else
        @advances = Advance.none
      end
    end

    def get_advance
      @advance = Advance.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Advance not found' }, status: :not_found
    end
    def reports_params
      params.require(:report_filters).permit(
        :report_type,
        :start_date,
        :end_date,
        :employee_id,
        :advance_type,
        :department
      )
    end
  end
end
