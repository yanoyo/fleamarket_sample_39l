Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products, only: [:index]
  get  'products/new'  =>  'products#new'
  get  'users/show'    =>  'users#show'
  get  'users/show/identification' => 'users#identification'
  get  'users/show/profile' => 'users#profile'
end
