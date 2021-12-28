Rails.application.routes.draw do
  # devise_for :users
  root "frontend#index"
  resources :authentications, only: [:new, :create, :destroy]
  resources :frontend, only: [:new, :create, :index, :show]
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#interal_server_error", via: :all
  match "/403", to: "errors#authentication_error", via: :all
  
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
  post "/profile/editprofile", to: "frontend#updateprofile"

  #logout
  get  "logout" ,to: "authentication#destroy"

  scope '/admin' do
    get '/customers', to: 'users#list_customer'
    resources :categories
    resources :users
    resources :discounts
    get '/users/:id/change-password', to: 'users#changepassword'
    patch '/users/:id/change-password', to: 'users#updatepassword'
    post '/users/:id/change-password', to: 'users#updatepassword'
    resources :products
  end

  
end
