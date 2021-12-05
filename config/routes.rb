Rails.application.routes.draw do
  devise_for :users
  root 'goals#index' #追記
  resources :goals

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
