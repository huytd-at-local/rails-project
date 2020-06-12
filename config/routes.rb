Rails.application.routes.draw do
  post '/users/:id/follow' => "follows#follow"
  post '/users/:id/unfollow' => "follows#unfollow"
  
  post '/posts/:id/likes/create' => 'likes#create'
  post '/posts/:id/likes/destroy' => 'likes#destroy'
  get '/search' => 'search#search'
  post '/logout' => 'users#logout'
  get '/login_form' => 'users#login_form'
  post '/login' => 'users#login'
  get "/users/index" => "users#index"
  post '/users/create' => "users#create"
  get '/users/new' => "users#new"
  get "/users/:id" => "users#show"
  get "/users/:id/edit" => "users#edit"
  post '/users/:id/update' => 'users#update'
  get '/posts/new' => "posts#new"
  post '/posts/create' => "posts#create"
  get '/posts/index' => "posts#index"
  get '/posts/:id' => "posts#show"

  get "/posts/:id/edit" => "posts#edit"
  post "/posts/:id/update" => "posts#update" 
  post '/posts/:id/destroy' => "posts#destroy"
  get '/' => "home#top"
  get "/about" => "home#about"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
