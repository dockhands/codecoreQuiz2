Rails.application.routes.draw do

  
  resources :ideas
  resources :users, only: [:new, :create, :destroy, :edit]
  resource :sessions, only: [:new, :create, :destroy]

end
