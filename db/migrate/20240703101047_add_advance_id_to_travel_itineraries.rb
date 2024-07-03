class AddAdvanceIdToTravelItineraries < ActiveRecord::Migration[7.0]
  def change
    add_column :travel_itineraries, :advance_id, :integer
  end
end
