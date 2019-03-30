class ProductsController < ApplicationController
	def index
	end

	def new
		@productCategories = ProductCategory.all
		@payShippings = PayShipping.all
		@prefectures = Prefecture.all
		@shippingDates = ShippingDate.all
	end

	def product_list
	end
	
	def buy_confirm
	end

end
