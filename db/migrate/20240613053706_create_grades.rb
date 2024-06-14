class CreateGrades < ActiveRecord::Migration[7.0]
  def change
    create_table :grades do |t|
      t.string :name
      t.string :category
      t.string :position_title
      t.decimal :basic_pay

      t.timestamps
    end
  end
end
