Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root to: 'pages#home'
  get 'home', to: 'pages#home'
  get '/bands/newacct', to: 'bands#newacct'

  resources :users, except: [:index]
  resources :bands
  resources :musicians, except: [:destroy, :index]
end
