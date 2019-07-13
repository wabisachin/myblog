Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "top#index"
  resources :posts, only: [:new,:edit,:create,:destroy,:update]
  resources :users, only: [:show,:edit,:update]
  resources :likes, only: [:create]
  resources :posts do 
    resources :likes, only: [:create,:destroy]
  end
  
end
