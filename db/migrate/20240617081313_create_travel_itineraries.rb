class CreateTravelItineraries < ActiveRecord::Migration[7.0]
  def change
    create_table :travel_itineraries do |t|
      t.date :start_date
      t.date :end_date
      t.string :from
      t.string :to

      t.timestamps
    end
  end
end
