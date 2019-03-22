Rails.application.routes.draw do
  devise_for :users
  root 'products#index'

  get 'signup', to: 'users#signup'
  get  'users/show'    =>  'users#show'
  get  'users/show/identification' => 'users#identification'
 
  resources :products, only: [:index, :new] do
  	collection do
      get 'product_list'
  		get 'buy_confirm'
  	end
  end

  resources :users, only: [:edit] do
  	collection do
      get 'logout'
      get 'card'
  	end
  end
  
  resources :profiles, only: [:edit]

end

