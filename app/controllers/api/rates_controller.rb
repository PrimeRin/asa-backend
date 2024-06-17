# frozen_string_literal: true

module Api
  class RatesController < ApplicationController
    before_action :set_rate, only: [:index, :update]

    def index
      render json: @rate
    end

    def update
      if @rate.update(rate_params)
        render json: @rate
      else
        render json: @rate.errors, status: :unprocessable_entity
      end
    end

    def get_country
      countries = DsaRate.distinct.pluck(:from)
      render json: countries
    end

    private

    def set_rate
      @rate = DsaRate.find_by!(from: rate_params[:from], to: rate_params[:to], grade_id: current_user.grade.id)
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Rate not found' }, status: :not_found
    end

    def rate_params
      params.require(:rate).permit(:from, :to)
    end
  end
end