Rails.application.routes.draw do
  root "pages#home"
  get '/home', to: 'pages#home'
resources :recipes 
resources :chefs, except: [:new, :destroy, :index]
get '/register', to: 'chefs#new'
get '/index', to: 'chefs#index'
get '/login', to: 'logins#new'
post '/login', to:'logins#create'
get '/logout', to:'logins#destroy'
#just testing this sign up
get '/signup', to:'sign_ups#signup'
post '/create', to:'sign_ups#create'
resources :styles, only: [:new, :create, :show]
resources :ingredients, only: [:new , :create, :show]
end
