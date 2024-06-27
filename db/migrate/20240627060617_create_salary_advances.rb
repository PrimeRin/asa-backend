class CreateSalaryAdvances < ActiveRecord::Migration[7.0]
  def change
    create_table :salary_advances do |t|
      t.integer :duration
      t.string :deduction
      t.string :completion_month
      t.string :status
      t.references :advance, null: false, foreign_key: true

      t.timestamps
    end
  end
end
