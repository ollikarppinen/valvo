Rails.application.routes.draw do
  root 'welcome#index'

  resources :votes, only: [:index, :new, :create, :show] do
    resources :voting_forms, only: [:index, :show] do
      resources :scanned_vote, only: [:index, :new, :create]
    end
  end
end
