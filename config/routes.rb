Rails.application.routes.draw do
  # devise_for :users
  root "frontend#index"
  resources :authentications, only: [:new, :create, :destroy]
  resources :frontend, only: [:new, :create, :index]

  #register
  get '/register', to: 'frontend#new'
  post '/register', to: 'frontend#create'

  # #login
  get '/login', to: 'authentication#new', as: 'login'
  post 'login', to: 'authentication#create'
  get '/test/:id', to: 'frontend#show'

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
