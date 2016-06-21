module Admin
  class UsersController < ApplicationController
    before_filter :authenticate_user!
    expose(:admin)
    expose(:users) { User.all.order(id: :asc).page params[:page] }
    expose(:user)

    def update
      user.update(user_params)

      respond_to do |format|
        if user.save
          format.html { redirect_to admin_users_path, notice: "User information was successfully update." }
        else
          format.tml { render :edit, notice: "Something wrong." }
        end
      end
    end

    def show
      return unless current_user.administrator?
      sign_in(:user, User.find(params[:id]))

      respond_to do |format|
        format.html { redirect_to root_url, notice: "Signed up as #{user.email}."}
      end
    end

    def user_params
      params.require(:user).permit(:role)
    end
  end
end
