class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  before_action :configure_sign_up_params, if: :devise_controller?



  private

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, profile_attributes: [:user_id, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_year, :birth_month, :birth_day, :mobile_phone, :card_number, :expiration_month, :expiration_year, :security_code]])

    devise_parameter_sanitizer.permit(:sign_up, keys: [address_attributes: [:zip_code, :prefecture_id, :city, :block, :building, :relative_family_name, :relative_first_name, :relative_family_name_kana, :relative_first_name_kana, :home_phone, :user_id]])

  end

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
