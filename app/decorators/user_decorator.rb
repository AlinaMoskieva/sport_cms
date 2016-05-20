class UserDecorator < ApplicationDecorator
  delegate :id, :full_name, :email, :role, :image, :subscribed_categories

  def full_name_with_email
    "#{object.full_name} (#{object.email})"
  end

  def administrator?
   object.role == "administrator"
  end

  def has_pages?
    object.pages.count > 0
  end

  def how_many_pages
    object.pages.count
  end

  def subscribed?(category_id)
    object.subscribed_categories.include?(category_id.to_s)
  end
end
