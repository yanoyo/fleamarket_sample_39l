class Category < ApplicationRecord
  has_ancestry
  has_many :sizes
  belongs_to :product
end
