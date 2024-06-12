# frozen_string_literal: true

class AddUsernameAndRoleToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string
    add_column :users, :role, :string
    add_index :users, :username, unique: true
  end
end
