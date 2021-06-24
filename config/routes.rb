Rails.application.routes.draw do
  root 'pages#home'
  get '/about', to: "pages#about"
  get '/your_reservations', to:'bookings#reservation'
  get '/your_trips', to:'bookings#trip'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :users, only: [:show, :edit, :update]

  resources :accommodations do
    resources :photos, only: [:create, :destroy]
    member do
      get "listing"
      get "price"
      get "description"
      get "photos"
      get "amenities"
      get "locations"
      get "preview"
      get "preload"
    end
  end

  resources :bookings, only: [:create, :destroy]
  resources :reviews, only: [:create, :destroy]
end
