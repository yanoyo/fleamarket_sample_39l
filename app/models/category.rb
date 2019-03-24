class Category < ApplicationRecord
  has_many :sizes
  belongs_to :product
end
