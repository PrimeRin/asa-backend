class AddGradeFieldToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :position_title, :string
    add_column :users, :basic_pay, :decimal
  end
end
