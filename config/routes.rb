Rails.application.routes.draw do

  devise_for :users
  namespace :users_backoffice do
    resources :tweets
    post 'tweets/:id/like', to: 'tweets#like', as: 'like_tweet'
    post 'tweets/:id/dislike', to: 'tweets#dislike', as: 'dislike_tweet'
    get 'users/timeline', to: 'users#timeline', as: 'timeline'
    put 'users/profile_update', to: 'users#update', as: 'profile_update'
    get 'users/search', to: 'users#search_for_user'
  end
  
  root to: 'users_backoffice/tweets#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
