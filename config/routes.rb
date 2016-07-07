Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"

  root to: "pages#index"
  resources :comments
  resources :pages
  resources :categories, only: [:index]
  resources :profile, only: [:index]
  resources :category_subscriptions
  resources :users_category
  resources :results
  resources :notifications, only: %i(index create destroy)
  resources :hashtags

  namespace :admin do
    resources :users
    resources :categories
  end

  resources :pages do
    resources :comments, shallow: true
  end

  devise_for :users
end
