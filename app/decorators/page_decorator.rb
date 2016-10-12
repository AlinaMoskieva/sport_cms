class PageDecorator < ApplicationDecorator

  delegate :title, :created_at, :category_id, :visitors, :category, :user,
    :comments_count, :body, :subscribe_status, :subscription_finder
  delegate :full_name, :id, to: :user, prefix: true
  delegate :category, :count, to: :category, prefix: true

  def data_format
    created_at.strftime("%m/%d/%Y at %I:%M%p ")
  end

  def preview_body
    object.body.html_safe.truncate(230)
  end

  def preview_title
    object.title.truncate(45)
  end

  def hours
    time_ago_in_words(object.created_at)
  end

  def subscribe_status(user)
    user.subscribed?(page.category.id)
  end

  def subscription_finder(user)
    Subscription.where(category_id: page.category_id, user_id: user.id).first
  end
end
