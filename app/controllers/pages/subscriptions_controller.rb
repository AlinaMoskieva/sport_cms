module Pages
  class SubscriptionsController < ApplicationController
    expose(:page)
    expose(:subscriptions)
    expose(:subscription)

    def create
      authorize subscription, :create?
      subscription.user = current_user
      subscription.category = page.category
      flash[:notice] = "Subscribed on #{subscription.category.category}"
      subscription.save
      redirect_to :back
    end
  end
end
