class AddReturnToTravelItineraries < ActiveRecord::Migration[7.0]
  def change
    add_column :travel_itineraries, :return, :boolean, default: false
  end
end
