Rails.application.routes.draw do
  resources :users
  resources :bands
  resources :musicians, except: [:destroy, :index]
  root to: 'pages#home'
  get 'home', to: 'pages#home'
end
