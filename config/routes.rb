Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products, only: [:index, :new] do
  	collection do
  		get 'buy_confirm'
  	end
  end
  resources :users, only: [:edit] do
  	collection do
  		get 'logout'
  	end
  end
  resources :profiles, only: [:edit]
end
