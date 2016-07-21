class UserDecorator < ApplicationDecorator
  decorates_association :pages

  private :pages

  delegate :id, :full_name, :email, :role, :pages,
    :pages_count, :subscriptions_count, :subscribed?

  def full_name_with_email
    "#{object.full_name} (#{object.email})"
  end

  def administrator?
    object.administrator?
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
end
