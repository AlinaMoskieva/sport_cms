class SubscriptionsController < ApplicationController
  expose(:subscriptions)
  expose(:subscription)

  def destroy
    authorize subscription
    if subscription.destroy
      redirect_to :back
      flash[:notice] = "Unsubscribed"
    end
  end
end
