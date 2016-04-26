Rails.application.routes.draw do

  root to: "pages#index"
  resources :comments
  resources :pages
  resources :categories
  resources :profile, only: [:index]
  resources :administrators

  resources :pages do
   resources :comments, shallow: true
  end

  devise_for :users

end
