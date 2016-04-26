class AdministratorsController < ApplicationController
  expose (:admin)
  expose (:users) { User.all.order(id: :asc) }

  def edit
     @user = User.find(params[:id]) if params[:id]
  end

  def update
    if @user.save
      redirect_to administrators_path
    else
      render :edit
    end
  end
end
