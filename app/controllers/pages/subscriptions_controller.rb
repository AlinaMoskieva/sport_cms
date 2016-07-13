module Pages
  class SubscriptionsController < ApplicationController
    respond_to :html
    expose(:page)
    expose(:subscriptions)
    expose(:subscription)

    def create
      authorize subscription, :create?
      subscription.user = current_user
      subscription.category = page.category
      respond_with subscription, location: -> { page } if subscription.save
    end

    def destroy
      authorize subscription
      respond_with subscription, location: -> { page } if subscription.destroy
    end
  end
end
