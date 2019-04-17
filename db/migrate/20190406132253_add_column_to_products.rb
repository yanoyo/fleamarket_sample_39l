class AddColumnToProducts < ActiveRecord::Migration[5.0]
  def change
  	add_column :products, :condition, :integer, default: 0, null: false
  	add_column :products, :shipping_from, :integer, default: 0, null: false
  	add_column :products, :shipping_method, :integer, default: 0, null: false
  	add_column :products, :shipping_term, :integer, default: 0, null: false
  end
end
