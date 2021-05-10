Rails.application.routes.draw do
  devise_for :users
  root "articles#index"
  get 'api_controller/index'

  resources :articles do
    resources :comments
  end
  
  
  resource :users, only: [:create]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"

  
end
