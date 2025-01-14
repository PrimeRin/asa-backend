# frozen_string_literal: true

class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.string :sender
      t.text :recipients
      t.string :message

      t.timestamps
    end
  end
end
