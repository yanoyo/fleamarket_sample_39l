class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.text :name, null: false
      t.references :category, foreign_key: true
      t.integer :price, null: false
      t.text :description, null: true
      t.timestamps
    end
  end
end
