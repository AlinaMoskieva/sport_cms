class CategoryDecorator < ApplicationDecorator
  delegate :category, :id

  def category
    object.category
  end

  def how_many_pages
    object.pages.count
  end
end
