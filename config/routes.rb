Rails.application.routes.draw do
  root 'root#top'
  devise_for :users
  resources :users
  resources :tweets do
    resource :comments, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
