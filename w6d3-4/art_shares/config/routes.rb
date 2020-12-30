Rails.application.routes.draw do
  # debugger
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :destroy, :create, :update] do
    resources :artworks, only: [:index]
    resources :comments, only: [:index]
  end
  # get '/users/:id', to:'users#show', as:'user' 
  # get '/users', to:'users#index', as:'users'
  # post '/users', to:'users#create'
  # get '/users/new', to:'users#new', as:'new_user'
  # get '/users/:id/edit', to:'users#edit', as:'edit_user'
  # patch '/users/:id', to:'users#update'
  # put '/users/:id', to:'users#update'
  # delete '/users/:id', to:'users#destroy'

  resources :artworks, only: [:show, :destroy, :create, :update] do 
    resources :comments, only:[:index]
  end

  resources :artwork_shares, only: [:create, :destroy]

  resources :comments, only: [:create, :destroy]
end
