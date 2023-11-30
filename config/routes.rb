Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/dashboard' => 'dashboards#show', as: :dashboard

  resources :teams do
    resources :players, only: %i[index new create]
  end

  resources :players, except: %i[new create]
  resources :games, only: %i[new create show] do
    member do
      get 'pdf', to: 'games#pdf'
      get 'result', to: 'games#result'
    end

    resources :player_actions, only: %i[create]
  end
end
