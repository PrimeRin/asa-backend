class AddPurposeToAdvances < ActiveRecord::Migration[7.0]
  def change
    add_column :advances, :purpose, :string
  end
end
