Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :users, only: :show

  # Defines the root path route ("/")
  root 'events#index'
  resources :events
end
