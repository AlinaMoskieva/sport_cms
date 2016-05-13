class CategoryDecorator < ApplicationDecorator
  delegate :category, :id

  def category
    object.category
  end

  def how_many_pages
    object.pages.count
  end

  def has_content?
    object.pages.count > 0
  end

  def first_letter
    object.category.slice(0)
  end

  def start_with?(letter)
    object.category.start_with?(letter)
  end
end
