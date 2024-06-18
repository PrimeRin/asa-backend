# frozen_string_literal: true

class ItineraryService
  def initialize(advance, itinerary_params)
    @advance = advance
    @itinerary_params = itinerary_params
  end

  def create
    @advance.travel_itineraries.create(@itinerary_params)
  end

  def update(itinerary, new_itinerary_params)
    itinerary.update(new_itinerary_params)
  end
end
