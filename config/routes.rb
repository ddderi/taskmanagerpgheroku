Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  post '/logout', to: 'sessions#destroy'
  get 'home', to: 'welcome#home'
  resources :user_tasks
  resources :tasks
  resources :users
  root 'welcome#home'
  resources :tasks do
    resources :users, only: [:edit]
  end
  
  resources :google_accounts

  get '/stats', to: 'admin#index', as: 'stats'

 get '/auth/google_oauth2/callback', to: "omniauth_callback#google"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
