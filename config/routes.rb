Rails.application.routes.draw do
  # devise_for :users
  root "frontend#index"
  resources :authentications, only: [:new, :create, :destroy]
  resources :frontend, only: [:new, :create, :index, :show]
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#interal_server_error", via: :all
  match "/403", to: "errors#authentication_error", via: :all
  
  #cart
  get 'carts', to: "carts#show", as: "cart"
  delete 'carts', to: "carts#destroy"

  post 'order_details/:id/add', to: "order_details#add_quantity", as: "order_detail_add"
  post 'order_details/:id/reduce', to: "order_details#reduce_quantity", as: "order_detail_reduce"
  post 'order_details', to: "order_details#create"
  get 'order_details/:id', to: "order_details#show", as: "order_detail"
  delete 'order_details/:id', to: "order_details#destroy"

  get '/categories/:id', to: "frontend#select_category"
  #register
  get '/register', to: 'frontend#new'
  post '/register', to: 'frontend#create'

  #login
  get '/login', to: 'authentication#new', as: 'login'
  post 'login', to: 'authentication#create'
  get '/product/:id/detail', to: 'frontend#show'

  #Change password
  get 'profile', to: 'frontend#profile'
  get 'profile/change-pass-customer', to: 'frontend#changepasscustomer'
  post 'profile/change-pass-customer', to: 'frontend#updatepasscustomer'
  
  #Change info
  get "/profile/editprofile", to: "frontend#editprofile"
  patch "/profile/editprofile", to: "frontend#updateprofile"

  #order history
  get "/profile/orderhistory", to: "frontend#orderhistory"
  get "/profile/orderdetail/:id", to: "frontend#orderdetail"

  #logout
  get  "logout" ,to: "authentication#destroy"

  scope '/admin' do
    get '/customers', to: 'users#list_customer'
    resources :categories
    resources :users
    resources :discounts
    get '/users/:id/change-password', to: 'users#changepassword'
    post '/users/:id/change-password', to: 'users#updatepassword'
    resources :products
    resources :orders
    get '/unapprove', to: 'orders#unapprove'
    get '/approve/:id', to: 'orders#approve'
    resources :dashboard, only: [:index, :show] 
  end
end
