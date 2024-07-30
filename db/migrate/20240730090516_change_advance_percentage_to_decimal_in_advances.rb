class ChangeAdvancePercentageToDecimalInAdvances < ActiveRecord::Migration[7.0]
  def change
    change_column :advances, :advance_percentage, :decimal, precision: 10, scale: 2
  end
end
