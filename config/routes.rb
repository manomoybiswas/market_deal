Rails.application.routes.draw do
  get 'categories/index'
  get 'categories/new'
  root "home#index"
  get :admin_dashboard, "users/dashboard"
  resources :users
  resources :sessions
  resources :categories
  resources :quantities
  resources :products
  resources :carts
end
