Rails.application.routes.draw do
  get "home/index"
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users do
    member do
      # follow & unfollow naming the routes
      post :follow, to: "follows#create"
      delete :unfollow, to: "follows#destroy"
    end
  end
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
  resources :users
  resources :interests, only: [:index, :show, :create, :update, :destroy]
  resources :user_interests, only: [:create, :destroy]
  resources :follow, only: [:index, :create, :destroy]
  resources :posts do
    resource :like, only: [:create, :destroy]
  end
  resources :posts do
    resource :share, only: [:create, :destroy]
  end
end
