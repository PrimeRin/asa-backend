class ChangeDsaAmountAndAdvanceAmountToJson < ActiveRecord::Migration[7.0]
  def change
    change_column :advances, :dsa_amount, :json, using: 'dsa_amount::json'
    change_column :advances, :advance_amount, :json, using: 'advance_amount::json'
  end
end
