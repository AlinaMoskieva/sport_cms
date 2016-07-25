class CategoriesController < ApplicationController
  expose_decorated(:categories)
  expose_decorated(:category, attributes: :category_params)

  def index
    self.categories = categories.order(:category)
  end
end
