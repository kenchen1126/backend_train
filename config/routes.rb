Rails.application.routes.draw do
  
  root "tasks#index"

  resources :tasks

  resources :users

  #session
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

end
