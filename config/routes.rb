Rails.application.routes.draw do
  devise_for :users
  root to: 'sells#index'
  resources :sells, only: [:index, :show, :destroy]
  resources :users, only: [:index, :create, :new, :show,]
end
