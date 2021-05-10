Rails.application.routes.draw do
  devise_for :users
  root "articles#index"
  get 'articles/indexApi'
  resources :articles do
    resources :comments
  end

  
end
