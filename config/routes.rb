Rails.application.routes.draw do
  devise_for :users
  root to:"home#index"

  authenticate :user do
    resources :product_models, only: [:new, :index]
    resources :warehouses, only: [:new, :create, :destroy, :edit, :update]
    resources :suppliers, only: [:new, :create, :destroy, :edit, :update]
    resources :orders
  end

  resources :suppliers, only: [:index, :show, :new, :create, :edit, :update]
  resources :warehouses, only: [:show, :update, :create, :new, :edit, :destroy]
  resources :product_models, only: [:index, :show, :new, :create, :destroy, :edit, :update]
  resources :orders, only: [:index, :show, :new, :create]

  namespace :api do
    namespace :v1 do
      resources :warehouses, only: [:index, :show]
    end
  end
end
