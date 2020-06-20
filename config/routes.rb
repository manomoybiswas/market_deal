Rails.application.routes.draw do
  root "home#index"
  resource :users
  resources :sessions
end
