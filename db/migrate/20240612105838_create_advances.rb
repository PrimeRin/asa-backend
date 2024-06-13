# frozen_string_literal: true

class CreateAdvances < ActiveRecord::Migration[7.0]
  def change
    create_table :advances do |t|
      t.string :advance_type
      t.string :status
      t.decimal :amount
      t.integer :verified_by
      t.integer :confirmed_by
      t.integer :dispatch_by
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
