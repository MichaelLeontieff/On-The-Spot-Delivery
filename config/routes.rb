Rails.application.routes.draw do
  resources :orders
  resources :customers, except: 'customers#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'signup', to: 'customers#new'

  get 'main_page', to: 'customers#main_page'

  get 'customer/login', to: 'sessions#new'
  post 'customer/login', to:'sessions#create'
  delete 'customer/logout', to: 'sessions#destroy'


end
