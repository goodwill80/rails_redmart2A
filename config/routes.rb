Rails.application.routes.draw do
  resources :categories_products
  resources :reviews
  resources :categories
  resources :products
  resources :users
  root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
