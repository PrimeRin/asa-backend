class AddFromPlaceAndToPlaceToTravelItineraries < ActiveRecord::Migration[7.0]
  def change
    add_column :travel_itineraries, :from_place, :string
    add_column :travel_itineraries, :to_place, :string
  end
end
