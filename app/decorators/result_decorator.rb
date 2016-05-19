class ResultDecorator < ApplicationDecorator
  delegate :country

  def get_category
    Category.find(object.category_id).category
  end
end
