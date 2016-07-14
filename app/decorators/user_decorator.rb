class UserDecorator < ApplicationDecorator
  decorates_association :pages

  private :pages

  delegate :id, :full_name, :email, :role, :image, :subscribed_categories, :pages,
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
end
