class RenamePayShippinngToShippingFee < ActiveRecord::Migration[5.0]
  def change
  	rename_table :pay_shippings, :shipping_fees
  end
end
