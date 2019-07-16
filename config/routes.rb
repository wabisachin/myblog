Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "top#index"
  resources :posts, only: [:show,:new,:edit,:create,:destroy,:update]
  resources :users, only: [:show,:edit,:update]
  resources :likes, only: [:create]
  resources :comments, only: [:destroy]
  
  resources :posts do 
    resources :comments,only: [:new,:create]
  end
  
  resources :posts do 
    resources :likes, only: [:create,:destroy]
  end
  
end
