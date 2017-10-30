Rails.application.routes.draw do

  get '/' => 'messages#new'
  resources :messages
  post '/' => 'messages#create'
end
