class ProfileController < ApplicationController
  expose_decorated(:user){ current_user }
  expose(:pages) { user.pages.includes(:category).order(created_at: :desc).page params[:page] }
  expose(:subscriptions) {  Category.where(id: current_user.subscribed_categories) }
end
