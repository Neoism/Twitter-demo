Rails.application.routes.draw do
  root 'root#top'
  devise_for :users
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :tweets do
    resource :comments, only: [:create]
    resource :favorites, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
