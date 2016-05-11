class CategorySubscriptionsController < ApplicationController
  expose(:pages){ pages_finder }
  expose(:category_subscription, attributes: :category_subscription_params )

  def new
    redirect_to :back
    create
  end

  def create
    if CategorySubscription.exists?(user_id: current_user.id )
      update
    else
      category_subscription.categories = params[:category_id]
      category_subscription.user = current_user
      if category_subscription.save
        flash[:notice] = "You successfully subscribed on #{ Category.find(params[:category_id]).category}"
      else
        flash[:notice] = "Alina is sad"
      end
    end
  end

  def update
    if current_user.categories.include?(params[:category_id])
     flash[:notice] = "You alredy have subscription on this content."

    else
      if current_user.categories << params[:category_id]
        flash[:notice] = "You successfully subscribed on #{ Category.find(params[:category_id]).category}"
      else
        flash[:notice] = "Alina is sad"
      end
    end
  end

  private

  def pages_finder
    Page.includes(:category)
        .includes(:user)
        .where(category_id: current_user.category_subscription)
  end

  def category_subscription_params
    params.require(:category_subscription).permit( :user_id, :categories)
  end
end
