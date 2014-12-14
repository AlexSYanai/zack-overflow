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
    member do
      post 'upvote'
      post 'downvote'
    end

    resources :comments do
      member do
        post 'upvote'
        post 'downvote'
      end
    end
  end

  resources :categories

end
