Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"

  resources :comments
  resources :pages
  resources :categories, only: [:index]
  resources :profile, only: [:index]
  resources :category_subscriptions
  resources :users_category
  resources :results
  resources :notifications, only: %i(index create destroy)
  resources :hashtags
  resources :subscriptions, only: %i(index destroy)

  namespace :admin do
    resources :users
    resources :categories
  end

  resources :pages do
    resources :comments, shallow: true
    resources :subscriptions, only: %i(create), module: :pages
  end

  devise_for :users

  root to: "pages#index"
end
