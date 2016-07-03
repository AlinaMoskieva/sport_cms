class CommentDecorator < ApplicationDecorator
  delegate :body, :user_id, :page_id, :created_at, :user
  delegate :full_name, to: :user, prefix: true

  def date
    object.created_at.strftime("%m.%d.%Y at %I:%M%P")
  end

  def persisted?
  end
end
