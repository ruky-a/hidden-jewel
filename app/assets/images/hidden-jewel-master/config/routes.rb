Rails.application.routes.draw do
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
root 'homepage#index'

resources :places do 
  resources :reviews, only: :create
  collection do
    get 'search'
  end
end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
