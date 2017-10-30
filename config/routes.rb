Rails.application.routes.draw do

  get '/new' => 'messages#new'
	require :messages
  post '/' => 'messages#create'
  get '/show/:id'=> 'messages#show'
end
