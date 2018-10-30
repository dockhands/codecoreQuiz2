Rails.application.routes.draw do

  
  resources :ideas do 
    resources :reviews, only: [ :create, :destroy ]
  end 
  resources :users, only: [:new, :create, :destroy, :edit]
  resource :sessions, only: [:new, :create, :destroy]

  root({ to: 'ideas#index' })
end
