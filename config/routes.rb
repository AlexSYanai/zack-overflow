Rails.application.routes.draw do

  root 'users#welcome'

  resources :users

  #SESSION ROUTES
  get ('/login') => 'sessions#new'
  post ('/login') => 'sessions#create'
  get ('/logout') => 'sessions#destroy'

  #USERS SIGNUP
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  resources :posts do
    resources :comments
  end

  get ('/categories/all') => 'categories#all'
  resources :categories

end
