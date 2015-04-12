Rails.application.routes.draw do
  use_doorkeeper

  resources :elections do
    resources :choices, only: [:new, :create, :index] do
      resources :votes, only: [:create]
    end
    resources :votes, only: [:index, :destroy]
  end

  resources :choices, only: [:destroy]


  root 'landing#index'
end
