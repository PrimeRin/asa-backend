class UpdateAdvances < ActiveRecord::Migration[7.0]
  def change
    add_column :advances, :dsa_amount, :decimal, precision: 10, scale: 2
    add_column :advances, :advance_amount, :decimal, precision: 10, scale: 2
  end
end
