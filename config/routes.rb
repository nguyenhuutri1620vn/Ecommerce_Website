Rails.application.routes.draw do
  # devise_for :users
  root "categories#index"

 
  scope '/admin' do
    resources :categories
    resources :users
    get '/users/:id/change-password', to: 'users#changepassword'
    patch '/users/:id/change-password', to: 'users#updatepassword'
    post '/users/:id/change-password', to: 'users#updatepassword'
  end

  #update-password
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
