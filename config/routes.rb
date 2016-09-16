Rails.application.routes.draw do
  resources :drivers
  resources :orders, except: 'orders'
  resources :customers, except: 'customers#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'signup', to: 'customers#new'

  get 'main_page', to: 'customers#main_page'
  get 'aboutus', to: 'pages#aboutus'
  get 'contactus', to: 'pages#contactus'
  get 'faq', to: 'pages#faqpage'

  # Customer Session Stuff
  get 'customer/login', to: 'customer_sessions#new'
  post 'customer/login', to:'customer_sessions#create'
  delete 'customer/logout', to: 'customer_sessions#destroy'

  # Driver Session Stuff
  get 'driver/login', to: 'driver_sessions#new'
  post 'driver/login', to:'driver_sessions#create'
  delete 'driver/logout', to: 'driver_sessions#destroy'

  # Operator Session Stuff
  get 'operator/login', to: 'operator_sessions#new'
  post 'operator/login', to:'operator_sessions#create'
  delete 'operator/logout', to: 'operator_sessions#destroy'


end
