Rails.application.routes.draw do
  root 'gossips#index'
  resources :users
  resources :gossips
end
