Rails.application.routes.draw do
  root to:"home#index"

  resources :suppliers, only: [:index, :show, :new, :create, :edit, :update]
  resources :warehouses, only: [:show, :update, :create, :new, :edit, :destroy]
  resources :product_models, only: [:index, :show, :new, :create]
end
