class ChangeSenderToHashInNotifications < ActiveRecord::Migration[7.0]
  def up
    # Change the sender column to type json without a default value
    change_column :notifications, :sender, :json
  end

  def down
    # Revert the sender column back to type string
    change_column :notifications, :sender, :string
  end
end
