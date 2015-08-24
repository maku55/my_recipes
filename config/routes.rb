Rails.application.routes.draw do
  root "pages#home"
  get '/home', to: 'pages#home'
resources :recipes 
resources :chefs, except: [:new, :destroy]
get '/register', to: 'chefs#new'
end
