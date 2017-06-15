Rails.application.routes.draw do
  resources :bands
  resources :musicians
  root to: 'pages#home'
  get 'home', to: 'pages#home'
end
