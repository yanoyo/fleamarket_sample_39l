class AddColumnsToProfilesFix < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :customer_id, :string, null: false
    add_column :profiles, :card_id, :string, null: false
  end
end
