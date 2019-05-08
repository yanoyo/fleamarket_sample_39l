class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index]

  def index
  end

  def edit
    @user = User.find(params[:user_id])
    @prefectures = Prefecture.all
  end

end
