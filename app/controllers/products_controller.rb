class ProductsController < ApplicationController

	def index
	end

	def new
	  @product = Product.new
	  @product.images.build
	  @categoryroot = Category.find(16).siblings
	end

	def create
	  @product = Product.new(product_params)
	  if @product.save
        redirect_to root_path(@product)
      end
	end

	def product_list
	end
	
	def buy_confirm
	end

	private
	def product_params
	  params.require(:product).permit(:name, :description, :category_id, :price, :condition, :shipping_fee, :shipping_method, :shipping_from, :shipping_term, images_attributes: {image: []})
	end
end
