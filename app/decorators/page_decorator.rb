class PageDecorator < ApplicationDecorator
  delegate :title, :body, :created_at, :category_id, :visitors, :category, :user
  delegate :full_name, to: :user, prefix: true
  delegate :category, :count, to: :category, prefix: true

  def comments_count
    object.comments_count
  end
end
