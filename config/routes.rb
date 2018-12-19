Rails.application.routes.draw do

  root 'welcome#index'
  get 'login', to: 'sessions#new'
  get 'about', to: 'welcome#show'

  delete '/logout', to: "sessions#destroy"

  resources :trips, only: [:new, :create, :index]

end
