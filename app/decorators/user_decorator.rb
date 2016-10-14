class UserDecorator < ApplicationDecorator
  decorates_association :pages

  private :pages

  delegate :id, :full_name, :email, :role, :pages,
    :pages_count, :subscriptions_count, :subscribed?, :administrator?

  def full_name_with_email
    "#{object.full_name} (#{object.email})"
  end

  def pages?
    object.pages_count > 0
  end

  def image_path
    object.image.blank? ? "noavatar.png" : object.image
  end

  def name_with_pages
    "#{object.full_name} (#{object.pages_count})"
  end

  def new_session
    "New session as #{object.email}".truncate(29)
  end

  def subscriptions?
    object.subscriptions.count > 0
  end

  def liked?(resource)
    Like.exists?(user_id: object.id, likeable_type: resource.to_model.class.name, likeable_id: resource.id)
  end
end
