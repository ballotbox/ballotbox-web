Rails.application.routes.draw do
  devise_for :users

  resources :elections, param: :random_id do
      resources :choices do 
          member { post :vote }
      end
      get 'result'
  end

  root 'landing#index'
end
