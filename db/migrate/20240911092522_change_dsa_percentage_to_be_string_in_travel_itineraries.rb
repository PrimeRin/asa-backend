class ChangeDsaPercentageToBeStringInTravelItineraries < ActiveRecord::Migration[7.0]
  def change
    change_column :travel_itineraries, :dsa_percentage, :string
  end
end
