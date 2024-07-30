class AddClaimDsaToAdvances < ActiveRecord::Migration[7.0]
  def change
    add_column :advances, :claim_dsa, :boolean
  end
end
