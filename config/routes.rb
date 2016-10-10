Rails.application.routes.draw do
  root 'welcome#index'

  resources :votes, only: [:index, :new, :create, :show]
  resources :voting_ends, only: [:create]
  resources :voting_starts, only: [:create]
  resources :voting_forms, only: [:show]
  resources :voting_decisions, only: [:create]
end
