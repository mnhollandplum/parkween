Rails.application.routes.draw do
  get 'login', to: redirect('/auth/google_oauth2'), as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'welcome', to: 'welcome#index'

  root to: "welcome#index"

  get 'about', to: 'welcome#show'

  delete '/logout', to: "sessions#destroy"

  resources :trips, only: [:new, :create, :index]

end
