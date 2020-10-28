Rails.application.routes.draw do
  root 'gossip#show'
  resources :users
  resources :gossips
end
