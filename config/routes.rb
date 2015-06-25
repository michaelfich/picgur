Rails.application.routes.draw do

  root 'images#index'

  resources :images

  # get '/images' => 'images#index'
  # get '/images/new' => 'images#new'
  # get '/images/:id' => 'images#show', as: 'image'
  # post '/images' => 'images#create'
end
