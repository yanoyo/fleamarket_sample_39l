Rails.application.routes.draw do
  devise_for :users
  root 'application#hello'
  get 'signup', to: 'users#signup'
  #   get 'registration', to: 'registrations#new'
  # end
  get 'logout', to: 'users#logout'
end
