class PageDecorator < ApplicationDecorator
  delegate :title, :body, :created_at, :category_id, :visitors, :category, :user,
    :comments_count
  delegate :full_name, to: :user, prefix: true
  delegate :category, :count, to: :category, prefix: true

  def data_format
    created_at.strftime("%m/%d/%Y at %I:%M%p ")
  end
end
