class AddOfficeOrderToAdvances < ActiveRecord::Migration[7.0]
  def change
    add_column :advances, :office_order, :string
  end
end
