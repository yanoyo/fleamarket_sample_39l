class ProfilesController < ApplicationController
	def edit
		@prefectures = Prefecture.all
	end
end
