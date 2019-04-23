class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index]

  def index
  end

  def edit
    @prefectures = Prefecture.all
  end
end
