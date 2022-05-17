Rails.application.routes.draw do
  devise_for :users
  root to:"home#index"

  authenticate :user do
    resources :product_models, only: [:new, :index]
    resources :warehouses, only: [:new, :create, :destroy, :edit, :update]
    resources :suppliers, only: [:new, :create, :destroy, :edit, :update]
  end

  resources :suppliers, only: [:index, :show, :new, :create, :edit, :update]
  resources :warehouses, only: [:show, :update, :create, :new, :edit, :destroy]
  resources :product_models, only: [:index, :show, :new, :create]
  end
