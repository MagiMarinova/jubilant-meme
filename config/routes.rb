Rails.application.routes.draw do

  get '/new' => 'messages#new'
  post '/' => 'messages#create'
  get '/show/:id'=> 'messages#show'
end
