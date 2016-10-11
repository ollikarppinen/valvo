Rails.application.routes.draw do
  root 'welcome#index'

  resources :votes, only: [:index, :new, :create, :show]
  resources :voting_forms, only: [:show, :update]

  get '/votes/:id/:uuid', to: 'votes#update'
end
