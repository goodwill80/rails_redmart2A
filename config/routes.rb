Rails.application.routes.draw do

  get '/users',  to: 'users#new'
  root 'static_pages#home'
  get  '/home',   to: 'static_pages#home'
  get  '/about',   to: 'static_pages#about'
  get  '/contact_us',   to: 'static_pages#contact_us'

  resources :categories_products
  resources :reviews
  resources :categories
  resources :products


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
