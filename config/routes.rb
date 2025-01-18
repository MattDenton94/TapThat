Rails.application.routes.draw do
  get "home/index"
  devise_for :users
  root to: "posts#index"

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  resources :users
  resources :interests, only: [:index, :show]
  resources :user_interests, only: [:index, :new, :create, :destroy]

  resources :posts, except: [:show] do
    resources :like, only: [:create, :destroy]
    resources :post_interests, only: [:create, :destroy]
    resources :share, only: [:create, :destroy]
    resources :comments, only: [:create, :edit, :destroy]
  end
end
