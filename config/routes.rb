Rails.application.routes.draw do
  get 'sessions/new'

  root 'static_pages#home'

  get '/users',  to: 'users#index'
  get '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  resources :users
  resources :microposts,          only: [:create, :destroy]

  get  '/home',   to: 'static_pages#home'
  get  '/about',   to: 'static_pages#about'
  get  '/contact_us',   to: 'static_pages#contact_us'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
