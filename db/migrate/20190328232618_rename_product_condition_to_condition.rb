class RenameProductConditionToCondition < ActiveRecord::Migration[5.0]
  def change
  	rename_table :product_conditions, :conditions
  end
end
