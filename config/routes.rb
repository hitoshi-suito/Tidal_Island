Rails.application.routes.draw do
  resources :blogs do
    resources :comments
  end
  devise_for :users
  root to: "blogs#index"

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  
end
