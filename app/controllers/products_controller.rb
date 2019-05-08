class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create, :product_list]

  require 'payjp'

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
    card = Profile.where(user_id: current_user.id).first
    Payjp::api_key = ENV['PAYJP_SECRET_KEY']
    customer = Payjp::Customer.retrieve(card.customer_id)
    @default_card_information = customer.cards.retrieve(card.card_id)
  end

  def pay
    card = Profile.where(user_id: current_user.id).first
    Payjp::api_key = ENV['PAYJP_SECRET_KEY']
    charge = Payjp::Charge.create(
      amount: @product.price,
      customer: card.customer_id,
      currency: 'jpy',
    )
    @product[:status] = 1
    @product.save
  end

  def destroy
    product = Product.find((params[:id]))
    if product.user_id == current_user.id
      product.destroy
    end
    redirect_to root_path
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :category_id, :price, :condition, :shipping_fee, :shipping_method, :shipping_from, :shipping_term, images_attributes: [:image]).merge(user_id: current_user.id)
  end

  def update_product_params
    params.require(:product).permit(:name, :description, :category_id, :price, :condition, :shipping_fee, :shipping_method, :shipping_from, :shipping_term, images_attributes: [:image, :_destroy, :id])
  end

end
