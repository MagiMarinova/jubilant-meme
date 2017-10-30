Rails.application.routes.draw do

  get '/' => 'messages#new'
  post '/' => 'messages#create'
  get '/show/:id'=> 'messages#show'
end
