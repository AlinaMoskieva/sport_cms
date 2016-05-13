module Admin
  class UsersController < ApplicationController
    before_filter :authenticate_user!
    expose(:admin)
    expose(:users) { User.all.order(id: :asc) }
    expose(:user)

    def update
      user.update(user_params)

      if user.save
        redirect_to admin_users_path
        flash[:notice] = 'User information was successfully update.'
      else
        render :edit
        flash[:notice] = 'Something wrong.'
      end
    end

    def show
      return unless current_user.administrator?
      sign_in(:user, User.find(params[:id]))
      redirect_to root_url
      flash[:notice] = "Log in as #{user.email}."
    end

    def user_params
      params.require(:user).permit(:role)
    end
  end
end
