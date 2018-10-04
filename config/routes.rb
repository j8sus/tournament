Rails.application.routes.draw do
  root 'tournaments#index'

  delete 'annihilate', to: 'annihilation#delete'


  resources :fake_teams, only: :create
  resources :fake_tournaments, only: :create


  resources :teams
  resources :tournaments do
    resources :groups, only: :create
    resources :playoffs, only: :create

    namespace :rounds do
      resources :games
    end
  end

end
