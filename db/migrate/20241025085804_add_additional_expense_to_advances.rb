class AddAdditionalExpenseToAdvances < ActiveRecord::Migration[7.0]
  def change
    add_column :advances, :additional_expense, :decimal
  end
end
