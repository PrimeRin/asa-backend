class CreateDsaRateThirdCountries < ActiveRecord::Migration[7.0]
  def change
    create_table :dsa_rate_third_countries do |t|
      t.string :country
      t.decimal :rate

      t.timestamps
    end
  end
end
