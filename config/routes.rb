Rails.application.routes.draw do
  root 'welcome#index'

  resources :votes, only: [:index, :new, :create, :show, :update]
  resources :voting_forms, only: [:show, :update]

  get '/voting_starts/:vote_id', to: 'voting_starts#create'
  get '/voting_ends/:vote_id', to: 'voting_ends#create'
end
