class CreatePayShippings < ActiveRecord::Migration[5.0]
  def change
    create_table :pay_shippings do |t|

      t.timestamps
    end
  end
end
