class RenameAndChangeTravelItineraryDates < ActiveRecord::Migration[7.0]
  def change
    rename_column :travel_itineraries, :start_date, :start
    rename_column :travel_itineraries, :end_date, :end

    change_column :travel_itineraries, :start, :datetime
    change_column :travel_itineraries, :end, :datetime
  end
end
