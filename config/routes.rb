Rails.application.routes.draw do
  devise_for :users
  use_doorkeeper
  resources :sessions, only: [:new, :create]
  get "logout" => 'sessions#destroy'
  root 'home#show'
end
