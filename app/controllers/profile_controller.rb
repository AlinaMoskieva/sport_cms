class ProfileController < ApplicationController
  expose_decorated(:user) { current_user }
  expose_decorated(:pages) { user.pages.includes(:category).order(created_at: :desc).page params[:page] }
  expose(:categories) { Category.where("id IN (?)", current_user.subscriptions.map(&:category_id)) }
end
