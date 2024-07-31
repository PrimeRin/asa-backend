class AddCurrencyToTravelItineraries < ActiveRecord::Migration[7.0]
  def change
    add_column :travel_itineraries, :currency, :string
  end
end
