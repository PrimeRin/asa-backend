class AddResetPasswordToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :reset_password, :boolean
  end
end
