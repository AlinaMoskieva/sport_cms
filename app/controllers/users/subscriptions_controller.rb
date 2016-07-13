module Users
  class SubscriptionsController < ApplicationController
    expose(:user)
    expose(:subscriptions)
    expose_decorated(:pages) { subscribed_pages_finder }
    expose(:categories) { |default| default.where("id IN (?)", user.subscriptions.map(&:category_id)) }

    private

    def subscribed_pages_finder
      Page.includes(:user).includes(:category)
       .where("category_id IN (?)", user.subscriptions.map(&:category_id))
       .page params[:page]
    end
  end
end
