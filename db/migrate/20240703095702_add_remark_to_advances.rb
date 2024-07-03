class AddRemarkToAdvances < ActiveRecord::Migration[7.0]
  def change
    add_column :advances, :remark, :string
  end
end
