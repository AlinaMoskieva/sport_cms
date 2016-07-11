class CommentDecorator < ApplicationDecorator
  delegate :user_id, :page_id, :created_at, :author, :page
  delegate :full_name, :email, :image, to: :author, prefix: true

  def date
    object.created_at.strftime("%m.%d.%Y at %I:%M%P")
  end

  def persisted?
  end

  def body
    object.body.html_safe
  end
end
