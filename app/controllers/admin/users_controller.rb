module Admin
  class UsersController < ApplicationController
    expose (:admin)
    expose (:users) { User.all.order(id: :asc) }

    def edit
      @user = User.find(params[:id]) if params[:id]
    end

    def update
      @user = User.find(params[:id]) if params[:id]

      if @user.save
        redirect_to admin_users_path
      else
        render :edit
      end
    end
  end
end
