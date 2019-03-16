class UsersController < ApplicationController
	def show
	end

	def identification
		@prefectures = Prefecture.all
	end
	
end
