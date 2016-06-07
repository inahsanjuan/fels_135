Rails.application.routes.draw do
  root "static_pages#home"
  get "help" => "static_pages#help"
  get "about" => "static_pages#about"
  get "contact" => "static_pages#contact"
  get "login" =>"sessions#new"
  post "login" =>"sessions#create"
  delete "logout" =>"sessions#destroy"
  resources :categories
  resources :users do
    resources :following, only: :index
    resources :followers, only: :index
  end

  resources :relationships, only: [:create, :destroy]
  get "signup" => "users#new"
  namespace :admin do
    root "categories#index"
    resources :users, only: [:destroy]
    resources :categories do
      resources :words
    end
  end
end
