Rails.application.routes.draw do
  root 'home#index'
  get '/auth/github/callback', to: 'sessions#create'
  resources :dashboard, only: [:index]
  get '/repositories', to: 'repo#index'
  get '/starred', to: 'starred#index'
  get '/followers', to: 'followers#index'
  get '/following', to: 'following#index'


  delete '/logout', to: 'sessions#destroy', as: :logout
end
