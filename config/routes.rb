Rails.application.routes.draw do
  resources :tides, only: [:index]
  resources :blogs do
    resources :comments
  end
  devise_for :users
  root to: "tides#index"

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  
end
