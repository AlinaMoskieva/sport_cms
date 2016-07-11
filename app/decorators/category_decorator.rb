class CategoryDecorator < ApplicationDecorator
  delegate :category, :id, :pages, :pages_count

  def content?
    object.pages_count > 0
  end

  def first_letter
    object.category.slice(0)
  end

  def start_with?(letter)
    object.category.start_with?(letter)
  end

  def how_many_viewed
    Page.where(category_id: object.id).sum("visitors")
  end
end
