class Product < ApplicationRecord
  belongs_to :user
  has_many :categories
  belongs_to :brand
  belongs_to :size
  has_many :images, dependent: :destroy
end
