class AddCurrencyToDsaRates < ActiveRecord::Migration[7.0]
  def change
    add_column :dsa_rates, :currency, :string
  end
end
