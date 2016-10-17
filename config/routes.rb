Rails.application.routes.draw do
  resources :payments
  resources :operators
  resources :delivers
  resources :checkingins
  resources :pickups
  resources :drivers
  resources :orders, except: 'orders'
  resources :customers, except: 'customers#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'signup', to: 'customers#new'

 # static page routes
  get 'aboutus', to: 'pages#aboutus'
  get 'contactus', to: 'pages#contactus'
  get 'faq', to: 'pages#faqpage'

  # User Session Stuff
  get 'user/login', to: 'sessions#new'
  post 'user/login', to:'sessions#create'
  delete 'user/logout', to: 'sessions#destroy'

  # Driver Stuff
  get 'driver_management_page', to: 'drivers#driver_main_page'

  # Customer Stuff
  get 'main_page', to: 'customers#main_page'

  # Operator Stuff
  get 'operator_management_page', to: 'operators#operator_main_page'
  get 'new_orders_page', to: 'operators#new_orders_page'
  get 'in_progress_orders_page', to: 'operators#in_progress_orders_page'
  get 'unpaid_orders_page', to: 'operators#unpaid_orders_page'

  get 'process_payment', to: 'payments#new'


end
