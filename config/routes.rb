Rails.application.routes.draw do

  devise_for :users
  namespace :users_backoffice do
    resources :tweets
  end
  
  root to: 'users_backoffice/tweets#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
