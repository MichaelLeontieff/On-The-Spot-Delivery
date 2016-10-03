Rails.application.routes.draw do
  resources :delivers
  resources :checkingins
  resources :pickups
  resources :drivers
  resources :orders, except: 'orders'
  resources :customers, except: 'customers#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'signup', to: 'customers#new'

  get 'main_page', to: 'customers#main_page'
  get 'driver_management_page', to: 'drivers#driver_main_page'
  get 'aboutus', to: 'pages#aboutus'
  get 'contactus', to: 'pages#contactus'
  get 'faq', to: 'pages#faqpage'

  # Customer Session Stuff
  get 'user/login', to: 'sessions#new'
  post 'user/login', to:'sessions#create'
  delete 'user/logout', to: 'sessions#destroy'


end
