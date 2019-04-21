Rails.application.routes.draw do
  devise_scope :user do
    get 'signup', to: 'users/registrations#signup'
    get "signup/registration", to: "users/registrations#sns", as: "new_user_registration"
    get "mypage", to: "users#show", as: "user"
  end
  devise_for :users,
  controllers: {
  omniauth_callbacks: 'users/omniauth_callbacks',
  registrations: 'users/registrations'
  }


  root 'products#index'


  resources :products, only: [:new] do
  	collection do
      get 'product_list'
  		get 'buy_confirm'
  	end
  end

  resources :users, only: [:show, :edit] do
    resource :profiles, only: [:edit]
    collection do
      get 'logout'
      get 'card'
  	end
  end

end


  # devise_for :users,
  # controllers: {
  # sessions: 'users/sessions' ,
  # registrations: 'users/registrations',
  # omniauth_callbacks: 'users/omniauth_callbacks'
  # }
  # devise_scope :user do
  #   get "users/sign_up/registration", to: "users/registrations#sns", as: "new_user_signup_registration"
  #   get "users/sign_up/sms_confirmation", to: "users/registrations#phone", as: "new_user_signup_sms_confirmation"
  #   get "users/sign_up/address_confirmation", to: "users/registrations#address", as: "new_user_signup_address_confirmation"
  #   get "users/sign_up/credit_confirmation", to: "users/registrations#credit", as: "new_user_signup_credit_confirmation"
  # end
