Rails.application.routes.draw do
  root to:"home#index"
  get("/suppliers", to:"suppliers#index")

  resources :suppliers, only: [:show, :new, :create, :edit, :update]

  resources :warehouses, only: [:show, :update, :create, :new, :edit, :destroy]
end
