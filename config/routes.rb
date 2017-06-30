Rails.application.routes.draw do
  #routes related to user accounts
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  #Home routes
  root to: 'pages#home'
  get 'home', to: 'pages#home'

  get '/bands/newacct', to: 'bands#newacct'

  #search musicians, add musician to bands
  post '/musicians/search', to:'musicians#search'
  get 'bands/:id/addmusician', to: 'bands#add_musician', as: 'band_add_musician'
  post 'bands/:id/addmusician', to: 'bands#create_musician'

  resources :users, except: [:index]
  resources :bands
  resources :musicians, except: [:destroy, :index]


end
