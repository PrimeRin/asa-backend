class AddDeletedToAdvances < ActiveRecord::Migration[7.0]
  def change
    add_column :advances, :deleted, :boolean, default: false
  end
end
