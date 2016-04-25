class ProfileController < ApplicationController
  expose_decorated(:user){ current_user }
  expose(:pages) { user.page.includes(:category).order(created_at: :desc) }

  def index
  end
end
