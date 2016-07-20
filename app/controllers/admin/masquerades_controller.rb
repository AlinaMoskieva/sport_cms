module Admin
  class MasqueradesController < ApplicationController
    def new
      session[:admin_id] = current_user.id
      user = User.find(params[:user_id])
      sign_in(user)
      redirect_to root_path, notice: "Now masquerading as #{user.full_name}"
    end

    def destroy
      user = User.find(session[:admin_id])
      sign_in(:user, user)
      session[:admin_id] = nil
      redirect_to admin_users_path, notice: "Stopped masquerading"
    end
  end
end
