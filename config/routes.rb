Rails.application.routes.draw do
  get 'categories/index'
  get 'categories/new'
  root "home#index"
  get :overview, "home/overview"
  resources :users do
    collection do
      get :email_validator
      get :username_validator
      get :mobile_validator
    end
  end
  resources :sessions
  resources :categories
  resources :quantities
  resources :products
  resources :carts
end
