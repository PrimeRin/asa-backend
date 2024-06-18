# frozen_string_literal: true

module Api
  class AdvancesController < ApplicationController
    before_action :set_advance, only: %i[show update]

    def index
      @pagy, @advances = pagy(AdvanceQuery.call(params[:advance], current_user, Advance.all).run,
                              page: params[:page] || 1)
      render json: { pagy: pagy_metadata(@pagy), advances: @advances }, status: :ok
    end

    def show
      render json: @advance, status: :ok
    end

    def create
      @advance = current_user.advances.new(advance_params)

      if @advance.save
        create_itinerary if itinerary_needed?
        attach_files if files_attached?
        render json: @advance, status: :created
      else
        render json: @advance.errors, status: :unprocessable_entity
      end
    end

    def update
      if @advance.update(advance_params)
        update_itinerary if itinerary_needed?
        update_files if files_params_present?
        render json: @advance, status: :ok
      else
        render json: @advance.errors, status: :unprocessable_entity
      end
    end

    private

    def attach_files
      params[:files]&.each { |file| @advance.files.attach(file) }
    end

    def files_attached?
      params[:files].present? && params[:files].is_a?(Array)
    end

    def update_itinerary
      @advance.travel_itineraries.update(itinerary_params)
    end

    def update_files
      @advance.files.attach(params[:files][:files])
    end

    def itinerary_params
      params.require(:travel_itinerary).permit(:start_date, :end_date, :from, :to)
    end

    def create_itinerary
      ItineraryService.new(@advance, itinerary_params).create
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
      params.require(:advance).permit(:advance_type, :status, :amount)
    end
  end
end
