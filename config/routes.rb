Rails.application.routes.draw do
  resources :bands
  root to: 'pages#home'
  get 'home', to: 'pages#home'
end
