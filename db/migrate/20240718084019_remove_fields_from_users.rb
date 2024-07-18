class RemoveFieldsFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :email, :string
    remove_column :users, :mobile_number, :string
    remove_column :users, :basic_pay, :decimal
    remove_column :users, :first_name, :string
    remove_column :users, :middle_name, :string
    remove_column :users, :last_name, :string
    remove_column :users, :position_title, :string
    remove_column :users, :department_name, :string
  end
end
