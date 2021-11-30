Rails.application.routes.draw do
  get 'dashboard/index'
  root "categories#index"
  devise_for :users
  resources :categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
