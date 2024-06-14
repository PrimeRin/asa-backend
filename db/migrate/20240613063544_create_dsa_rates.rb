class CreateDsaRates < ActiveRecord::Migration[7.0]
  def change
    create_table :dsa_rates do |t|
      t.string :from
      t.string :to
      t.decimal :rate
      t.references :grade, null: false, foreign_key: true

      t.timestamps
    end
  end
end
