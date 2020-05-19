Rails.application.routes.draw do
  root 'posts#index'
  resources :posts
  resources :users , only: [:show, :new, :create]
  resources :sessions , only: [:new, :create, :destroy]
end
