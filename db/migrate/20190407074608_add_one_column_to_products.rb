class AddOneColumnToProducts < ActiveRecord::Migration[5.0]
  def change
  	add_column :products, :shipping_fee, :integer, default: 0, null: false
  end
end
