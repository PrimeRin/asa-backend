# frozen_string_literal: true

class CreateAttachments < ActiveRecord::Migration[7.0]
  def change
    create_table :attachments do |t|
      t.string :attachment_type
      t.string :file_url
      t.references :advance, null: false, foreign_key: true

      t.timestamps
    end
  end
end
