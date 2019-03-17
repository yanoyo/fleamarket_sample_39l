Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products, only: [:index]
  get 'signup', to: 'users#signup'
  get 'logout', to: 'users#logout'
  get  'products/new'  =>  'products#new'
  get  'users/show'    =>  'users#show'
  get  'users/show/identification' => 'users#identification'
  resources :products, only: [:index, :new]
  resources :users, only: [:edit]
  resources :profiles, only: [:edit]
end

