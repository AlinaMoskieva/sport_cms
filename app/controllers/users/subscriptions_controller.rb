module Users
  class SubscriptionsController < ApplicationController
    expose(:user)
    expose(:subscriptions)
    expose_decorated(:pages) { subscribed_pages_finder }
    expose(:categories) { |default| default.where(id: category_ids ) }

    private

    def category_ids
      user.subscriptions.map(&:category_id)
    end

    def subscribed_pages_finder
      Page.includes(:user).includes(:category)
        .where(id: category_ids)
        .page params[:page]
    end
  end
end
