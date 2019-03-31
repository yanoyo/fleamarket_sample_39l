class CreateShippingMethods < ActiveRecord::Migration[5.0]
  def change
    create_table :shipping_methods do |t|

      t.timestamps
    end
  end
end
