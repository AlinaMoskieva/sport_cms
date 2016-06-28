class CommentDecorator < ApplicationDecorator
  delegate :body, :user_id, :page_id, :created_at

  def date
    object.created_at.strftime("%m.%d.%Y at %I:%M%P")
  end

  def comment_author
    "Commenter: #{object.user.full_name}"
  end

  def persisted?
  end
end
