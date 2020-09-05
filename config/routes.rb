Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :sells, only: [:index, :show, :destroy]
  resources :users, only: [:index, :create, :new, :show,]
  resources :items  do
    resources :purchases
  end
end
