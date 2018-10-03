Rails.application.routes.draw do
  root 'tournaments#index'

  delete 'erase_db', to: 'erase#erase'

  resources :teams do
    post :create_fake, on: :collection
  end

  resources :tournaments do
    post :create_fake, on: :collection

    resources :rounds do
      post :generate_result, on: :collection

      resources :games
    end
  end
end
