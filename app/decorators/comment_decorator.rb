class CommentDecorator < ApplicationDecorator
  delegate :body, :user_id, :page_id

  def author
    object.user.full_name
  end
end
