Rails.application.routes.draw do
  root 'pages#home'
  get '/about', to: "pages#about"
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :accommodations do
    resources :photos, only: [:create, :destroy]
    member do
      get "listing"
      get "price"
      get "description"
      get "photos"
      get "amenities"
      get "locations"
    end
  end
end
