Rails.application.routes.draw do
  devise_scope :user do
    get 'signup', to: 'users/registrations#signup'
    get "signup/registration", to: "users/registrations#new", as: "new_user_registration"
    get "mypage", to: "users#show", as: "user"
  end
  devise_for :users,
  controllers: {
  omniauth_callbacks: 'users/omniauth_callbacks',
  registrations: 'users/registrations'
  }


  root 'products#index'

  get 'signup', to: 'users#signup'
  resources :products, only: [:new, :show, :create, :edit, :update] do
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
