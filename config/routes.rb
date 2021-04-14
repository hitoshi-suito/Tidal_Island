Rails.application.routes.draw do
  resources :blogs
  devise_for :users
  root to: "blogs#index"

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  
end
