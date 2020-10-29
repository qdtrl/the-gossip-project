Rails.application.routes.draw do
  root 'gossips#index'
  resources :users
  resources :gossips
  resources :cities, only: [:index, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :comments
  resources :gossips do
    resources :comments
  end
end
