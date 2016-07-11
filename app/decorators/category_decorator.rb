class CategoryDecorator < ApplicationDecorator
  delegate :category, :id, :pages

  def content?
    object.pages.count > 0
  end

  def pages_count
    object.pages_count
  end

  def first_letter
    object.category.slice(0)
  end

  def start_with?(letter)
    object.category.start_with?(letter)
  end

  def how_many_viewed
    viewed = Page.where(category_id: object.id).sum("visitors")
  end
end
