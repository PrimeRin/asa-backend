module Api
  class ItineraryController < ApplicationController
    before_action :authenticate_user!
    before_action :set_advance, only: %i[index]
    before_action :set_itinerary, only: %i[show]

    def index
      itineraries = @advance.travel_itineraries
      render json: itineraries, status: :ok
    end

    def show
      render json: @itinerary, status: :ok
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
  end
end
