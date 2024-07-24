class CreateStopOverRates < ActiveRecord::Migration[7.0]
  def change
    create_table :stop_over_rates do |t|
      t.decimal :value
      t.string :country
      t.string :grade_name
      t.decimal :rate
      t.string :currency

      t.timestamps
    end
  end
end
