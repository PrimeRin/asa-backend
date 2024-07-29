module Api
  class ItinerariesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_advance, only: %i[index ]
    before_action :set_itinerary, only: %i[show update destroy]


    def create
      @itinerary = travel_itineraries.create(itinerary_params)
      if @itinerary.save
        render json: @itinerary, status: :created
      else
        render json: @itinerary.errors, status: :unprocessable_entity
      end
    end

    def index
      itineraries = @advance.travel_itineraries
      render json: itineraries, status: :ok
    end

    def show
      render json: @itinerary, status: :ok
    end

    def update
      if @itinerary.update(itinerary_params)
        render json: @itinerary, status: :ok
      else
        render json: @itinerary.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @itinerary.destroy
      head :no_content
    end

    private

    def set_itinerary
      @itinerary = TravelItinerary.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Travel Itinerary not found' }, status: :not_found
    end

    def set_advance
      @advance = Advance.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Advance not found' }, status: :not_found
    end
    def itinerary_params
      params.require(:travel_itinerary).permit(
        :start_date,
        :end_date,
        :from,
        :to,
        :advance_id,
        :rate,
        :mode,
        :dsa_percentage,
        :halt_at,
        :mileage,
        :days
      )
    end
  end
end
