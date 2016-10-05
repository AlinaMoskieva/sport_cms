class PageDecorator < ApplicationDecorator
  delegate :title, :created_at, :category_id, :visitors, :category, :user,
    :comments_count, :body, :likes
  delegate :full_name, :id, to: :user, prefix: true
  delegate :category, :count, to: :category, prefix: true
  delegate :count, to: :likes, prefix: true

  def data_format
    created_at.strftime("%m/%d/%Y at %I:%M%p ")
  end

  def preview_body
    object.body.html_safe.truncate(230)
  end

  def shorten_title
    object.title.truncate(79)
  end

  def like?(user)
    Like.exists?(user_id: user.id, likeable_type: object.class.name, likeable_id: object.id)
  end
end
