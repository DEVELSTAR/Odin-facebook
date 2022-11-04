Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  resources :users do
    resources :posts
  end
  resources :friendships
  resources :friend_requests
end
