class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:edit, :update]

  def signup
  end

  def show
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def identification
    @prefectures = Prefecture.all
  end

  def edit
  end

  def logout
  end

  def card
  end

  def logout
  end

  def new
    @user = User.new
    @user.build_profile
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
