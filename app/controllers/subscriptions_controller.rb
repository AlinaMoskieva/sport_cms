class SubscriptionsController < ApplicationController
  expose(:subscription, attributes: :subscription_params)
  expose(:subscriptions)

  def new
    if params[:category_id]
      redirect_to :back
      create
    end
  end

  def create
    subscription.user_id = current_user.id
    subscription.category_id = params[:category_id]
    flash[:format] = "Subscribed on #{Category.find(params[:category_id]).category}"  if subscription.save
  end

  def destroy
    if subscription.destroy
      redirect_to :back
      flash[:format] = "Unsubscribed"
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:user_id, :category_id)
  end
end
