class RenameStartAndEndToStartDateAndEndDateInTravelItinerary < ActiveRecord::Migration[7.0]
  def change
    rename_column :travel_itineraries, :start, :start_date
    rename_column :travel_itineraries, :end, :end_date
  end
end
