class UsersController < ApplicationController
  def signup
  end

  def logout
  end

  def show
	end

	def identification
		@prefectures = Prefecture.all
	end
end
