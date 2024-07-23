class RemoveDetailFromTravelItinerary < ActiveRecord::Migration[7.0]
  def change
    remove_column :travel_itineraries, :detail, :string
  end
end
