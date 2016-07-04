class UserDecorator < ApplicationDecorator
  delegate :id, :full_name, :email, :role, :image, :subscribed_categories, :pages
  delegate :count, to: :pages, prefix: true

  def full_name_with_email
    "#{object.full_name} (#{object.email})"
  end

  def full_name
    object.full_name
  end

  def administrator?
    object.role == "administrator"
  end

  def pages?
    object.pages.count > 0
  end

  def subscribed?(category_id)
    object.subscribed_categories.present? && object.subscribed_categories.include?(category_id.to_s)
  end
end
