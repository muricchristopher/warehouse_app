Rails.application.routes.draw do
  root to:"home#index"

  resources :warehouses, only: [:show, :update, :create, :new, :edit, :destroy]
end
