class AddAmountToTravelItineraries < ActiveRecord::Migration[7.0]
  def change
    add_column :travel_itineraries, :amount, :decimal
  end
end
