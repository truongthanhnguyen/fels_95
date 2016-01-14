Rails.application.routes.draw do

  root   "static_pages#home"
  get    "signup"  => "users#new"
  get    "login"   => "sessions#new"
  post   "login"   => "sessions#create"
  delete "logout"  => "sessions#destroy"
  get "password_resets/new"
  get "password_resets/edit"
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :activities, only: [:create, :destroy]
  resources :relationships, only: [:index, :create, :destroy]
end
