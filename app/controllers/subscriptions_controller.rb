class SubscriptionsController < ApplicationController
  expose(:subscription)

  def destroy
    authorize subscription
    page = Page.find(subscription.page.id)
    respond_with subscription, location: -> { page } if subscription.destroy
  end
end
