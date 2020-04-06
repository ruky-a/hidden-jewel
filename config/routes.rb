Rails.application.routes.draw do
  get '/dashboard', to: 'users#dashboard'
  post 'users/edit', to: 'users#update'
 
    devise_for :users
 


root 'homepage#index'
  get '/about', to: 'about#index'
  get '/search', to: 'homepage#search'
  get '/contact', to: 'homepage#contact'
  post 'messages', to: 'messages#create'

resources :places do 
  resources :reviews, only: :create
  member do 

    delete :delete_photo
    post :upload_photo
  end

  
end




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
