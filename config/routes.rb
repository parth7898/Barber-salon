Rails.application.routes.draw do
  # 🔐 Auth
  post '/signup', to: 'auth#signup'
  post '/login',  to: 'auth#login'

  # 🏪 Shops + Nested Resources
  resources :shops do
    resources :services, only: [:index, :create]
    resources :bookings, only: [:index]
  end
end