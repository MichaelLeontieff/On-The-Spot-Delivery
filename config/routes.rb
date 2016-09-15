Rails.application.routes.draw do
  resources :drivers
  resources :orders, except: 'orders'
  resources :customers, except: 'customers#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'signup', to: 'customers#new'

  get 'main_page', to: 'customers#main_page'
  get 'aboutus', to: 'pages#aboutus'
  get 'customer/login', to: 'customer_sessions#new'
  post 'customer/login', to:'customer_sessions#create'
  delete 'customer/logout', to: 'customer_sessions#destroy'


end
