Rails.application.routes.draw do
  devise_for :users
  root 'application#hello'
  get 'signup', to: 'users#signup'
  get 'logout', to: 'users#logout'
end
