class ProfileController < ApplicationController
  expose_decorated(:user) { current_user }
  expose(:pages) { user.pages.includes(:category).order(created_at: :desc).page params[:page] }
  expose(:subscriptions) { Category.where("id IN (?)", current_user.subscriptions.map(&:category_id)) }
end
