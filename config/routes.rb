Rails.application.routes.draw do
  root "home#index"
  get :admin_dashboard, "users/dashboard"
  resources :users
  resources :sessions
  resources :product_categories
  resources :quantities
  resources :products
end
