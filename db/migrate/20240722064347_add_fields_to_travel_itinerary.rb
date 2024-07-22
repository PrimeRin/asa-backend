class AddFieldsToTravelItinerary < ActiveRecord::Migration[7.0]
  def change
    add_column :travel_itineraries, :mode, :string
    add_column :travel_itineraries, :dsa_percentage, :integer
    add_column :travel_itineraries, :halt_at, :string
    add_column :travel_itineraries, :mileage, :float
    add_column :travel_itineraries, :days, :integer
    add_column :travel_itineraries, :detail, :text
  end
end
