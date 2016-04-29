Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root to: "pages#index"
  resources :comments
  resources :pages
  resources :categories
  resources :profile, only: [:index]


  namespace :admin do
    resources :users
  end

  resources :pages do
   resources :comments, shallow: true
  end

  devise_for :users
end
