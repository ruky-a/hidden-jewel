Rails.application.routes.draw do
    devise_for :users
 
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

root 'homepage#index'
  get '/about', to: 'about#index'
  get '/search', to: 'homepage#search'

resources :places do 
  resources :reviews, only: :create

  
end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
