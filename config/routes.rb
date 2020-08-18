Rails.application.routes.draw do
  get 'sells/index'
  devise_for :users
  root to: 'sells#index'
  resources :sells, only: :index
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
