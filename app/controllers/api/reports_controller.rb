module Api
  class ReportsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_advance, only: %i[index]

    def index
      case reports_params[:report_type]
      when "individual"
        generate_individual_report
      else
        generate_all_reports
      end
    end

    private

    def generate_individual_report
      @advances = @advances.where(username: reports_params[:employee_id])
      total = calculate_total_amount
      if @advances.empty?
        render json: { message: "There are no advances for this employee." }, status: :not_found
      else
        render json: { advances: @advances, total: total }, status: :ok
      end
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
      filters[:advance_type] = reports_params[:advance_type] unless reports_params[:advance_type] == 'all'
      filters[:department] = reports_params[:department] unless reports_params[:department] == 'all'

      @advances = @advances.where(filters)
      total = calculate_total_amount

      render json: { advances: @advances, total: total }, status: :ok
    end

    def set_advance
      start_date = Date.parse(reports_params[:start_date]) rescue nil
      end_date = Date.parse(reports_params[:end_date]) rescue nil
      if start_date && end_date
        @advances = Advance.where(
          status: "dispatched",
          updated_at: start_date.beginning_of_day..end_date.end_of_day
        )
      else
        @advances = []
      end
    end

    def reports_params
      params.permit(
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
