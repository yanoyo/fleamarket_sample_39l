class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.text       :name, null: false
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.integer    :price, null: false
      t.text       :description, null: false
      t.timestamps
    end
  end
end
