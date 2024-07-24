class RemoveGradeNameFromStopOverRates < ActiveRecord::Migration[7.0]
  def change
    remove_column :stop_over_rates, :grade_name, :string
  end
end
