class UserDecorator < ApplicationDecorator
  delegate :id, :full_name, :email, :role, :image, :subscribed_categories, :pages
  delegate to: :pages, prefix: true

  decorates_association :pages

  def full_name_with_email
    "#{object.full_name} (#{object.email})"
  end

  def administrator?
    object.administrator?
  end

  def pages?
    object.pages_count > 0
  end

  def pages_count
    object.pages_count
  end

  def subscribed?(category_id)
    object.subscribed_categories.present? && object.subscribed_categories.include?(category_id.to_s)
  end
end
