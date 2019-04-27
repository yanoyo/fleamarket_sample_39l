class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create]

  def index
  end

  def new
    @product = Product.new
    @product.images.build
    @categoryroot = Category.find(1).siblings
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path(@product)
    else
      redirect_to new_product_path
    end
  end
  
  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product.images.build
    @categoryroot = Category.find(1).siblings
    @category_ids = Category.find(@product.category_id).path_ids
  end

  def update
    if @product.update(update_product_params)
      redirect_to root_path(@product)
    else
      redirect_to edit_product_path
    end
  end

  def product_list
  end

  def buy_confirm
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :category_id, :price, :condition, :shipping_fee, :shipping_method, :shipping_from, :shipping_term, images_attributes: [:image])
  end

  def update_product_params
    params.require(:product).permit(:name, :description, :category_id, :price, :condition, :shipping_fee, :shipping_method, :shipping_from, :shipping_term, images_attributes: [:image, :_destroy, :id])
  end

end
