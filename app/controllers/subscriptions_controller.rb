class SubscriptionsController < ApplicationController
  expose_decorated(:pages) { subscribed_pages_finder }
  expose(:subscription)
  expose(:categories) { |default| default.where("id IN (?)", current_user.subscriptions.map(&:category_id)) }

  def destroy
    authorize subscription
    if subscription.destroy
      redirect_to :back
      flash[:notice] = "Unsubscribed"
    end
  end

  private

  def subscribed_pages_finder
    Page.includes(:user).includes(:category)
      .where("category_id IN (?)", current_user.subscriptions.map(&:category_id))
      .page params[:page]
  end
end
