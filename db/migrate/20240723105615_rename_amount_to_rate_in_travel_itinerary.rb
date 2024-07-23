class RenameAmountToRateInTravelItinerary < ActiveRecord::Migration[7.0]
  def change
    rename_column :travel_itineraries, :amount, :rate
  end
end
