class PageDecorator < ApplicationDecorator
  include ActionView::Helpers::DateHelper

  delegate :title, :created_at, :category_id, :visitors, :category, :user,
    :comments_count, :body, :likes

  delegate :full_name, :id, to: :user, prefix: true
  delegate :category, :count, to: :category, prefix: true
  delegate :count, to: :likes, prefix: true

  def data_format
    created_at.strftime("%m/%d/%Y at %I:%M%p ")
  end

  def preview_body
    body.html_safe.truncate(230)
  end

  def preview_title
    title.truncate(45)
  end

  def hours
    time_ago_in_words(object.created_at)
  end

  def subscription_block_for(user)
    if user.unsubscribed?(category_id)
      h.link_to "Subscribe", h.page_subscriptions_path(page), method: :post, class: "small button"
    else
      h.link_to "Unsubscribe", ([page, subscription(user)]), method: :delete, class: "small alert button"
    end
  end

  private

  def subscription(user)
    Subscription.find_by(category: page.category, user_id: user.id)
  end
end
