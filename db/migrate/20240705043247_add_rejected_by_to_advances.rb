class AddRejectedByToAdvances < ActiveRecord::Migration[7.0]
  def change
    add_column :advances, :rejected_by, :integer
  end
end
