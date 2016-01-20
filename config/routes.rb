Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end

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
  resources :words, only: [:index, :create, :destroy]
  resources :categories do
    resources :lessons, only: [:index]
  end
  resources :lessons, only: [:show, :update] do
    resources :results, only: [:index]
  end
  resources :results, only: [:show, :update]
end
