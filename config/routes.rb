Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users

  resources :elections do
    resources :choices, only: [:new, :create, :index] do
      resources :votes, only: [:create]
    end
    resources :votes, only: [:index, :destroy]
  end
  resources :choices, only: [:destroy]

  namespace :api do
    namespace :v1 do
      resources :elections
      resources :choices
      resources :votes
    end
  end

  root 'landing#index'
end
