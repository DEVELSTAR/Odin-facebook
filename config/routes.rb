Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  resources :users do
    resources :posts
    resources :friend_requests
    resources :friendships
  end
end
