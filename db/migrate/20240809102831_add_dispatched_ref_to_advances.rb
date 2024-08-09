class AddDispatchedRefToAdvances < ActiveRecord::Migration[7.0]
  def change
    add_column :advances, :dispatched_ref, :json
  end
end
