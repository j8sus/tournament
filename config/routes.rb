Rails.application.routes.draw do
  root 'tournaments#index'

  delete 'erase_db', to: 'erase#erase'

  resources :teams do
    post :create_fake, on: :collection
  end

  resources :tournaments do
    resources :rounds do
      resources :games
    end
  end
end
