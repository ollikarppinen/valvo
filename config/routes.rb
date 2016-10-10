Rails.application.routes.draw do
  root 'welcome#index'

  resources :votes, only: [:index, :new, :create, :show]
  resources :voting_ends, only: [:new, :create]
  resources :voting_starts, only: [:new, :create]
  resources :voting_forms, only: [:show]
  resources :voting_decisions, only: [:new, :create]
end
