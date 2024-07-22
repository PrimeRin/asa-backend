class RemoveGradeIdAndAddGradeNameToDsaRates < ActiveRecord::Migration[7.0]
  def change
    remove_column :dsa_rates, :grade_id, :integer
    add_column :dsa_rates, :grade_name, :string
  end
end
