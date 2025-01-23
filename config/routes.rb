Rails.application.routes.draw do
  get "home/index"
  devise_for :users
  root to: "pages#home"
  # root to: "posts#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"

  # ability to follow & unfollow a user
  resources :users do
    member do
      post "follow"
      delete "unfollow"
    end
  end

  # retrive following & followers list
  # resources :follows, only: [:index]
  # resources :follows, only: [] do
  #   collection do
  #     get "following"
  #     get "followers"
  #   end
  # end

  # resources :interests, only: [:index, :show, :create, :update, :destroy]
  resources :interests, only: [:index, :show]
  resources :user_interests, only: [:index, :new, :create, :destroy]

  resources :posts do
    resources :like, only: [:create, :destroy]
    resources :post_interests, only: [:create, :destroy]
    # resources :interests, only: [:index, :show]
    # resources :user_interests, only: [:index, :new, :create, :destroy]
    resources :share, only: [:create, :destroy]
    resources :comments, only: [:create, :edit, :destory]
  end
end
