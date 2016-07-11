module Admin
  class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_resource, only: %i(show update index)
    expose(:users) { |users| users.order(id: :asc).page params[:page] }
    expose(:user, attributes: :user_params)

    def update
      user.update(user_params)

      respond_to do |format|
        if user.save
          format.html { redirect_to admin_users_path, notice: "Update." }
        else
          format.tml { render :edit, notice: "Something wrong." }
        end
      end
    end

    def show
      sign_in(:user, User.find(params[:id]))

      respond_to do |format|
        format.html { redirect_to root_url, notice: "Signed up as #{user.email}." }
      end
    end

    private

    def user_params
      params.require(:user).permit(:role)
    end

    def authorize_resource
      authorize user
    end
  end
end
