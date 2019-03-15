Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products, only: [:index]
#   root 'application#hello'
  get  'products/new'  =>  'products#new'
end
