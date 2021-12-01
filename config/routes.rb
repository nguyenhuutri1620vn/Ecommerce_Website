Rails.application.routes.draw do
  # devise_for :users
  root "categories#index"

  scope '/admin' do
    get '/customers', to: 'users#list_customer'
    resources :categories
    resources :users
    get '/users/:id/change-password', to: 'users#changepassword'
    patch '/users/:id/change-password', to: 'users#updatepassword'
    post '/users/:id/change-password', to: 'users#updatepassword'
    
  end

end
