class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index]
	def index
		@prefectures = Prefecture.all
	end
end
