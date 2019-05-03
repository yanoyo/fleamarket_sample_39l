class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create, :buy_confirm]

  require 'payjp'

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
    else
      redirect_to new_product_path
    end
  end

  def edit
    @product.images.build
    @categoryroot = Category.find(16).siblings
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
    @product = Product.find(111)
    @payjppy = ENV['PAYJP_PUBLIC_KEY']
  end

  def pay
    Payjp::api_key = ENV['PAYJP_SECRET_KEY']
    charge = Payjp::Charge.create(
      :amount => @product.price,
      :card => params['payjp-token'],
      :currency => 'jpy',
    )
    @product[:status] = 1
    if @product.save
      redirect_to root_path(@product)
    else
      redirect_to buy_confirm_path
    end
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
