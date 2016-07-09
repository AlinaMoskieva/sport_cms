class CategoryDecorator < ApplicationDecorator
  delegate :category, :id, :pages
  delegate :count, to: :pages, prefix: true

  def content?
    object.pages.count > 0
  end

  def first_letter
    object.category.slice(0)
  end

  def start_with?(letter)
    object.category.start_with?(letter)
  end

  def how_many_viewed
    viewed = 0
    object.pages.each do |c|
      viewed += c.visitors
    end
  end
end
