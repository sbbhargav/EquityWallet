Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
   
  resources :stocks

  get '/sign_up', to: 'registrations#new'

  post '/sign_up', to: 'registrations#create'

  resources :sessions, only: [:create]

  get '/sign_in', to: 'sessions#new', as: 'login'

  delete '/logout', to: 'sessions#destroy'


  get '/dashboard', to: 'stock_dashboard#index'

  root 'stocks#index'

  # Defines the root path route ("/")
  # root "articles#index"
end
