class AddImageToImages < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :image, :text
  end
end
