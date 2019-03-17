class ProfilesController < ApplicationController
	def index
		@prefectures = Prefecture.all
	end
end
