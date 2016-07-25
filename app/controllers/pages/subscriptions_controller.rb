module Pages
  class SubscriptionsController < ApplicationController
    respond_to :html
    expose(:page)
    expose(:subscriptions)
    expose(:subscription)
    before_action :authorize_resource

    def create
      subscription.user = current_user
      subscription.category = page.category
      subscription.save
      respond_with subscription, location: page
    end

    def destroy
      subscription.destroy
      respond_with subscription, location: page
    end

    private

    def authorize_resource
      authorize subscription
    end
  end
end
