class AddAdvancePercentageToAdvances < ActiveRecord::Migration[7.0]
  def change
    add_column :advances, :advance_percentage, :integer
  end
end
