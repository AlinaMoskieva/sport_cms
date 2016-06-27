class UsersCategoryController < ApplicationController

  def new
    if params[:category_id]
      redirect_to :back
      create
    end
  end

  def create
    current_user.subscribed_categories = [] if current_user.subscribed_categories.nil?
    if current_user.subscribed_categories.include?(params[:category_id])
      destroy
    else
      current_user.subscribed_categories << params[:category_id]
      flash[:notice] = "You successfully subscribed on #{ Category.find(params[:category_id]).category}" if current_user.save
    end
  end

  def destroy
    return unless current_user.subscribed_categories.include?(params[:category_id])
    if current_user.subscribed_categories.delete(params[:category_id])
      flash[:notice] = "You successfully unsubscribe on
      #{ Category.find(params[:category_id]).category}"
      current_user.save
    end
  end
end
