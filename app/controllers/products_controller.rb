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
end
