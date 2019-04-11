class Users::RegistrationsController < Devise::RegistrationsController

  # def new
  #  super
  # end

  # def create
  #   super
  # end

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
  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, profile_attributes: [
                                 :family_name,
                                 :first_name,
                                 :family_name_kana,
                                 :first_name_kana,
                                 :birth_year,
                                 :birth_month,
                                 :birth_day
                               ])
  end
   # protected

  # def after_signup_path_for(resorce)
  #   root_path
  # end

  # def update_resource(resource, params)
  #   resource.update_without_current_password(params)
  # end

end
