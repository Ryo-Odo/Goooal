Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
   }

  root 'homes#index'
  resources :goals
  resources :users, only: [:show, :index]
  resources :profiles
  resources :tweets
  resources :comments
  resources :relationships, only: [:create, :destroy]

end
