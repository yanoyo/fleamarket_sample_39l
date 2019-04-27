class Users::RegistrationsController < Devise::RegistrationsController
  # prepend_before_action :check_captcha, only: [:create]
  before_action :configure_sign_up_params, only: [:create]

  def signup
  end

  def new
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation]
      )
    @user.build_profile(
      family_name: session[:family_name],
      first_name: session[:first_name],
      family_name_kana: session[:family_name_kana],
      first_name_kana: session[:first_name_kana],
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      birth_day: session[:birth_day]
      )
    @user.build_address(
      relative_family_name: session[:relative_family_name],
      relative_first_name: session[:relative_first_name],
      relative_family_name_kana: session[:relative_family_name_kana],
      relative_first_name_kana: session[:relative_first_name_kana],
      zip_code: session[:zip_code],
      prefecture: session[:prefecture_id],
      city: session[:city],
      block: session[:block],
      building: session[:building],
      home_phone: session[:home_phone]
      )
  end

  def create
    @user = User.new(sign_up_params)
    if @user.save

    else
      redirect_to new_user_registration_path
    end
  end

  def address
    @address = Address.new(
      relative_family_name: session[:relative_family_name],
      relative_first_name: session[:relative_first_name],
      relative_family_name_kana: session[:relative_family_name_kana],
      relative_first_name_kana: session[:relative_first_name_kana],
      zip_code: session[:zip_code],
      prefecture: session[:prefecture_id],
      city: session[:city],
      block: session[:block],
      building: session[:building],
      home_phone: session[:home_phone]
      )
  end

  private
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up) do |params|
      params.permit(:nickname, :email, :password, :password_confirmation,
                    profile_attributes: [:family_name, :first_name, :family_name_kana, :first_name_kana, :birth_year, :birth_month, :birth_day, :mobile_phone, :card_number, :expiration_month, :expiration_year, :security_code, :user_id],
                    address_attributes: [:zip_code,:prefecture_id, :city, :block, :building, :relative_family_name, :relative_first_name, :relative_family_name_kana, :relative_first_name_kana, :home_phone, :user_id]
                    )
    end
  end

  def address_params
    params.require(:address).permit(:zip_code, :prefecture_id, :city, :block, :building, :relative_family_name, :relative_first_name, :relative_family_name_kana, :relative_first_name_kana, :home_phone)
  end

  # def check_captcha
  #   self.resource = resource_class.new sign_up_params
  #   resource.validate
  #   unless verify_recaptcha(model: resource)
  #     respond_with_navigational(resource) { render :new }
  #   end
  # end
end
