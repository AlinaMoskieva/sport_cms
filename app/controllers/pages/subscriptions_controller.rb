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
      subscription.save
      respond_with subscription, location: -> { page }
    end

    def destroy
      authorize subscription
      subscription.destroy
      respond_with subscription, location: -> { page }
    end
  end
end
