Rails.application.routes.draw do
  use_doorkeeper do
    controllers :applications => 'protected_applications'
  end
  devise_for :users

  resources :elections do
    #resources :choices, only: [:new, :create, :index]
    #resources :votes, only: [:index]
    get 'result'
  end
  resources :votes, only: [:create, :destroy]
  #resources :choices, only: [:destroy]

  namespace :api do
    namespace :v1 do
      resources :elections
      #resources :choices
      resources :votes
    end
  end

  root 'landing#index'
end
