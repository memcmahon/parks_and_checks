Rails.application.routes.draw do
  root to: 'welcome#index'

  get 'auth/:provider/callback',  to: 'sessions#create'
  get '/lougout', to: 'sessions#destroy'
end
