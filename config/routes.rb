Rails.application.routes.draw do
  devise_for :users
  devise_for :models
  resources :articles do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #set route path
  root 'articles#index'
  root to: "home#index"
end
