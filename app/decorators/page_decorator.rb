class PageDecorator < ApplicationDecorator
  delegate :title, :body, :created_at, :category_id, :visitors

  decorates_association :comments

  def author
    object.user.full_name
  end

  def how_many_comments
    object.comments.count
  end

  def category
    object.category
  end
end
