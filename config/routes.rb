Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  resources :users do
    resources :posts, only: [:index, :new, :create]
    resources :friend_requests
    resources :friendships
  end

  resources :posts, only: [:show, :edit, :update, :destroy] do
    resources :comments
    resources :likes
  end
end
