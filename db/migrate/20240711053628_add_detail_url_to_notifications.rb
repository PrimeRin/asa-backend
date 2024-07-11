class AddDetailUrlToNotifications < ActiveRecord::Migration[7.0]
  def change
    add_column :notifications, :detail_url, :string
  end
end
