class AddTourTypeToAdvances < ActiveRecord::Migration[7.0]
  def change
    add_column :advances, :tour_type, :string
  end
end
