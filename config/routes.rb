Rails.application.routes.draw do
  get 'sessions/new'

  root 'static_pages#home'


  get '/users',  to: 'users#new'
  post '/users',  to: 'users#create'

  resources :users

  get  '/home',   to: 'static_pages#home'
  get  '/about',   to: 'static_pages#about'
  get  '/contact_us',   to: 'static_pages#contact_us'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :categories_products
  resources :reviews
  resources :categories
  resources :products



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
