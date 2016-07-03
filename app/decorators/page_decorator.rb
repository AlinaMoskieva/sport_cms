class PageDecorator < ApplicationDecorator
  delegate :title, :body, :created_at, :category_id, :visitors, :category, :user
  delegate :full_name, to: :user, prefix: true
  delegate :category, to: :category, prefix: true

  decorates_association :comments

  def how_many_comments
    object.comments.count
  end
end
