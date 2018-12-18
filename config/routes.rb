Rails.application.routes.draw do

  root 'welcome#index'
  get 'login', to: 'sessions#new'
  get 'about', to: 'welcome#show'

end
