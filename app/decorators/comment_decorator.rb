class CommentDecorator < ApplicationDecorator
  delegate :full_name, :email, :image, to: :author, prefix: true
  delegate :user_id, :page_id, :created_at, :page, :author

  def date
    object.created_at.strftime("%m.%d.%Y at %I:%M%P")
  end

  def persisted?
  end

  def body
    object.body.html_safe
  end

  def image_path
    author.image.blank? ? "noavatar.png" : author.image
  end
end
