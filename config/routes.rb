Rails.application.routes.draw do
  root "pages#home"
  get '/home', to: 'pages#home'
resources :recipes 
resources :chefs, except: [:new, :destroy]
get '/register', to: 'chefs#new'
get '/login', to: 'logins#new'
post '/login', to:'logins#create'
get '/logout', to:'logins#destroy'
#just testing this sign up
get '/new_user', to:'sign_ups#signup'
post '/signup', to:'sign_ups#create'
end
