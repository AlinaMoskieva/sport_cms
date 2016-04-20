class PageDecorator < ApplicationDecorator
  delegate :title, :body, :theme, :created_at

  decorates_association :comments

  def author
    object.user.full_name
  end

  def how_many_comments
    object.comments.count
  end
end
