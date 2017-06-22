Rails.application.routes.draw do
  root to: 'pages#home'
  get 'home', to: 'pages#home'
  get '/bands/newacct', to: 'bands#newacct'

  resources :users, except: [:index]
  resources :bands
  resources :musicians, except: [:destroy, :index]


end
