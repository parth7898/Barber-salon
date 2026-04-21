Rails.application.routes.draw do
  post '/signup', to: 'auth#signup'
  post '/login',  to: 'auth#login'
  resources :shops, only: [:create, :index]
end
