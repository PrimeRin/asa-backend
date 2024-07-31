class AddCurrencyToDsaRateThirdCountries < ActiveRecord::Migration[7.0]
  def change
    add_column :dsa_rate_third_countries, :currency, :string
  end
end
