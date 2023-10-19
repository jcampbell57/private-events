Rails.application.routes.draw do
  devise_for :users
  # Defines the root path route ("/")
  root 'events#index'
  resources :events, only: %i[index]
end
