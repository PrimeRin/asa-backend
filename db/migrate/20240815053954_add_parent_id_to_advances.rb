class AddParentIdToAdvances < ActiveRecord::Migration[7.0]
  def change
    add_column :advances, :parent_id, :integer
  end
end
