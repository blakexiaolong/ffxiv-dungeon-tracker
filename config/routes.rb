Rails.application.routes.draw do
  namespace :metrics do
    resources :raids, only: [:index, :show]
    resources :deep_dungeons, only: [:index, :show]
    resources :trials, only: [:index, :show]
    resources :dungeons, only: [:index, :show]
    resources :roulettes, only: [] do
      collection do
        get :roulette_xp
        get :instance_xp
        get :total_xp
        get :instance_time
        get :queue_time
        get :total_time
        get :roulette_efficiency
      end
    end
    resources :roulette_calculator, only: [:new, :create]  do
      collection do
        get '/' => 'roulette_calculator#new'
      end
    end
  end
  resources :instance_entries, only: [:new, :create]
  root 'instance_entries#new'
end
