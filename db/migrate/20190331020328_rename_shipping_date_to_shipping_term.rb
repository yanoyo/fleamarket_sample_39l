class RenameShippingDateToShippingTerm < ActiveRecord::Migration[5.0]
  def change
  	rename_table :shipping_dates, :shipping_terms
  end
end
