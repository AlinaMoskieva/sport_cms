module Pages
  class SubscriptionsController < ApplicationController
    respond_to :json
    expose :page
    expose :subscription
    before_action :authorize_resource

    def create
      subscription.user = current_user
      subscription.category = page.category
      subscription.save
      respond_with subscription, location: nil
    end

    def destroy
      subscription.destroy
      respond_with subscription, location: nil
    end

    private

    def authorize_resource
      authorize subscription
    end
  end
end
