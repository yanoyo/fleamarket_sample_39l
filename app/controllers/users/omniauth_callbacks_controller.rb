class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  include Devise::Controllers::Rememberable

  def after_sign_in_path_for(resource)
    if current_user.profile
      root_path
    else
      new_user_registration_path
    end
  end

  def facebook
    callback_for(:facebook)
  end

  def google_oauth2
    callback_for(:google)
  end

  def callback_for(provider)
    @user = User.create_from_auth!(request.env["omniauth.auth"])
    if @user.persisted?
      #after_sign_in_path_forと同じパス
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else
      session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to new_user_registration_path
    end
  end

  def failure
    redirect_to root_path
  end

end
