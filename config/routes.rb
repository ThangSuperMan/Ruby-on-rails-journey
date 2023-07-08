Rails.application.routes.draw do
  root "articles#index"
  # get '/articles', to: 'articles#index'
  # get '/articles/:id', to: 'articles#show'

  # Provide some default useful map routes and some fancy method for erb use
  resources :articles
end
