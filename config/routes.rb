Rails.application.routes.draw do
  resources :elections, param: :random_id do
      resources :choices do 
          member { post :vote }
      end
  end

  root 'landing#index'
end
