Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"

  resources :comments, only: %i(update destroy show)
  resources :pages, only: %i(new update destroy index show)
  resources :categories, only: [:index]
  resources :profile, only: [:index]
  resources :results, only: %i(index destroy show)
  resources :notifications, only: %i(index create destroy)
  resources :hashtags, only: %i(index create show)

  namespace :admin do
    resources :results, only: %i(create new)
    resources :users, only: %i(update show index edit)
    resources :categories, only: %i(index create destroy)
  end

  resources :pages do
    resources :comments, shallow: true
    resources :subscriptions, only: %i(create destroy), module: :pages
  end

  resources :user do
    resources :subscriptions, only: %i(index), module: :users
  end

  devise_for :users

  root to: "pages#index"
end
