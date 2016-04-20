Rails.application.routes.draw do
  resources :comments
  resources :pages
  resources  :categories

  resources :pages do
   resources :comments, shallow: true
  end
  devise_for :users

  root to: "pages#index"
end
