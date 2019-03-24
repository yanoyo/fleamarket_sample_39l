class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def signup
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
  end

  def edit
  end

  def logout
  end

  def card
  end

	def logout
	end

  def set_user
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email)
  end

end
