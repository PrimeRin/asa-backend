class ChangeDsaPercentageToFloatInTravelItineraries < ActiveRecord::Migration[7.0]
  def up
    change_column :travel_itineraries, :dsa_percentage, :float
  end
end
