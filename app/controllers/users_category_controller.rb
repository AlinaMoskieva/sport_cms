class UsersCategoryController < ApplicationController
  expose(:user){ current_user }

  def new
    if params[:category_id]
      redirect_to :back
      create
    end
  end

  def create
    authorize user, :create_subscription?
    if current_user.subscribed_categories.nil?
      current_user.subscribed_categories = []
    else
      if current_user.subscribed_categories.include?(params[:category_id])
        destroy
      else
        current_user.subscribed_categories << params[:category_id]
        if current_user.save
          flash[:notice] = "You successfully subscribed on #{ Category.find(params[:category_id]).category}"
        end
      end
    end
  end

  def destroy
    authorize user, :destroy_subscription?
    return if !current_user.subscribed_categories.include?(params[:category_id])
    if current_user.subscribed_categories.delete(params[:category_id])
      flash[:notice] = "You successfully unsubscribe on #{ Category.find(params[:category_id]).category}"
    end
    current_user.save
  end
end
