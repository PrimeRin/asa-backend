# frozen_string_literal: true

module Api
  class RatesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_rate, only: %i[index update]

    def index
      render json: @rate
    end

    def mileage
      render json: { rate: 16 }, status: :ok
    end

    def third_country
      rate = DsaRateThirdCountry.find_by(country: third_country_rate_params[:country])
      render json: { rate: rate }, status: :ok
    end

    def create
      @rate = DsaRate.new(rate_params)

      if @rate.save
        render json: @rate, status: :created
      else
        render json: @rate.errors, status: :unprocessable_entity
      end
    end

    def update
      if @rate.update(rate_params)
        render json: @rate, status: :ok
      else
        render json: @rate.errors, status: :unprocessable_entity
      end
    end

    def get_country_to
      countries =  DsaRateThirdCountry.distinct.pluck(:country)
      render json: countries
    end

    private

    def set_rate
      @rate = DsaRate.find_by!(from: rate_params[:from], to: rate_params[:to], grade_name: grade_name)
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Rate not found' }, status: :not_found
    end

    def grade_name
      user = Icbs::EmployeeMst.find_by(employeecode: current_user.username)
      return unless user

      grade = Icbs::GradeMst.find_by(gradeid: user.gradeid)
      return unless grade

      grade_category = Icbs::GradeCategory.find_by(categoryid: grade.categoryid)
      grade_category&.categoryname
    end

    def rate_params
      params.require(:rate).permit(:from, :to, :grade_id)
    end

    def third_country_rate_params
      params.require(:rate).permit(:country)
    end
  end
end
