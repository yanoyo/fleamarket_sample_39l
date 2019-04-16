Rails.application.routes.draw do
  devise_for :users
  root 'products#index'

  get 'signup', to: 'users#signup'
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
