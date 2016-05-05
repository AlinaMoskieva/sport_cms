class ProfileController < ApplicationController
  expose_decorated(:user){ current_user }
  expose(:pages) { user.pages.includes(:category).order(created_at: :desc).page params[:page] }
end
