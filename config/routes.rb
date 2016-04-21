Rails.application.routes.draw do

  root to: "pages#index"
  resources :comments
  resources :pages
  resources  :categories

  resources :pages do
   resources :comments, shallow: true
  end
  devise_for :users

end
