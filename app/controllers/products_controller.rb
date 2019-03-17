class ProductsController < ApplicationController
	def index
	end

	def new
		@productCategories = ProductCategory.all
		@productConditions = ProductCondition.all
		@payShippings = PayShipping.all
		@prefectures = Prefecture.all
		@shippingDates = ShippingDate.all
	end

	def buy_confirm
	end

end
