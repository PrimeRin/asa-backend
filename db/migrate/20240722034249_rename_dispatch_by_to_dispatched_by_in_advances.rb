class RenameDispatchByToDispatchedByInAdvances < ActiveRecord::Migration[7.0]
  def change
    rename_column :advances, :dispatch_by, :dispatched_by
  end
end
