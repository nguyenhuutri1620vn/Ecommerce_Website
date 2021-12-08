Rails.application.routes.draw do
  get '/products' , to: 'products#index'
  root "categories#index"
  devise_for :users
  resources :categories
  resources :products

end
