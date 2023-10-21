Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :users, only: :show

  # Defines the root path route ("/")
  root 'events#index'
  resources :events do
    resources :event_attendees, only: %i[create destroy]
    # resources :event_attendees, only: %i[new create]
  end
end
