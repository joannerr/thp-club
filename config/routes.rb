Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'


  get '/page-club', to: 'users#secret_page'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users
end
