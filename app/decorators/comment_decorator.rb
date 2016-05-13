class CommentDecorator < ApplicationDecorator
  delegate :body, :user_id, :page_id, :created_at

  def author
    object.user.full_name
  end

  def date
    object.created_at.strftime("%m.%d.%Y at %I:%M%P")
  end
end
