class Product < ApplicationRecord
  has_many :categories
  has_many :images, dependent: :destroy, inverse_of: :product
  accepts_nested_attributes_for :images, allow_destroy: true

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }
    validates :category_id
    validates :condition
    validates :shipping_fee
    validates :shipping_method
    validates :shipping_from
    validates :shipping_term
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end

  enum condition: {
  	unused: 1,
  	near_unused: 2,
  	no_noticeable_scratches_or_strains: 3,
  	some_scratches_and_dirt: 4,
  	scratches_and_dirt: 5,
  	bad: 6
  }

  enum shipping_fee: {
	  postage_included: 1,
	  cash_on_delivery: 2
  }

  enum shipping_method: {
    undecided: 1,
    rakuraku_mercari: 2
  }

  enum shipping_from: {
    hokkaido: 1,
    aomori: 2
  }

  enum shipping_term: {
  	one_to_two_days: 1,
  	two_to_three_days: 2,
  	four_to_seven_days: 3
  }

end
