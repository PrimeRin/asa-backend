class AddStopAtToTravelItineraries < ActiveRecord::Migration[7.0]
  def change
    add_column :travel_itineraries, :stop_at, :string
  end
end
