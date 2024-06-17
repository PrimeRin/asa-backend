# frozen_string_literal: true

class AddGradeIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :grade_id, :integer
  end
end
