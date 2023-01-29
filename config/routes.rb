# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'

  resources :items, only: %i[index show]

  resources :carts, only: [:show]

  resources :orders, only: %i[create show index]

  post 'create_or_update', to: 'carts#create_or_update'

  # api routes
  namespace :api, defaults: { format: 'json' } do
    resources :items, only: [:index]
    resources :carts, only: %i[index create]
    resources :orders, only: %i[create update]
  end
  resources :orders, only: %i[create show index]
end
