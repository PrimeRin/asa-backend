# frozen_string_literal: true

class ItineraryService
  def initialize(advance, itinerary_params)
    @advance = advance
    @itinerary_params = itinerary_params
  end

  def create
    @itinerary_params.each do |itinerary|
      @advance.travel_itineraries.create(itinerary)
    end
  end

  def update
    @advance.travel_itineraries.delete_all
    create
  end
end
