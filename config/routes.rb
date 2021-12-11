Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
   }

  root 'homes#index'
  resources :goals, only: [:index, :new, :show, :create, :destroy]
  resources :users, only: [:show, :index]
  resources :profiles, only: [:edit, :update]
  resources :tweets, only: [:index, :show, :create, :destroy]
  resources :comments, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :helps, only: [:index]

end
