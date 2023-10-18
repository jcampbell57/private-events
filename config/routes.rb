Rails.application.routes.draw do
  # Defines the root path route ("/")
  root 'events#index'
  resources :events, only: %i[index]
end
