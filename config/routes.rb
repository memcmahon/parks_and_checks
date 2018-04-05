Rails.application.routes.draw do
  root to: 'welcome#index'

  get 'auth/:provider/callback',  to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/dashboard', as: 'dashboard', to: 'dashboard#index'
  get '/profile', as: 'profile', to: 'users#show'
  get '/gifts', as: 'gifts', to: 'gifts#index'
  get '/favorites', as: 'favorites', to: 'favorites#index'
end
