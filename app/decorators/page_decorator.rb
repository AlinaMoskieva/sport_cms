class PageDecorator < ApplicationDecorator
  delegate :title, :body, :created_at, :category_id

  decorates_association :comments

  def author
    object.user.full_name
  end

  def how_many_comments
    object.comments.count
  end

  def get_category
    object.category
  end
end
