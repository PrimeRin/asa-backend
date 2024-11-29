class AddNetpayToSalaryAdvances < ActiveRecord::Migration[7.0]
  def change
    add_column :salary_advances, :netpay, :integer
  end
end
