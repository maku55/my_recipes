Rails.application.routes.draw do
  root "pages#home"
  get '/home', to: 'pages#home'

  resources :recipes do
      member do
          post 'like'
      end
  end
resources :chefs, except: [:new, :destroy]
get '/register', to: 'chefs#new'
get '/login', to: 'logins#new'
post '/login', to:'logins#create'
get '/logout', to:'logins#destroy'
#just testing this sign up
#get '/signup', to:'sign_ups#signup'
#post '/create', to:'sign_ups#create'
resources :styles, only: [:new, :create, :show]
resources :ingredients, only: [:new , :create, :show]
end
