class RnamePrefectureToShippingFrom < ActiveRecord::Migration[5.0]
  def change
  	rename_table :prefectures, :shipping_froms
  end
end
