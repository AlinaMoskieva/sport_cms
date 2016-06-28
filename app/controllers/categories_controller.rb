class CategoriesController < ApplicationController
  expose_decorated(:categories) { Category.all.order(:category) }
  expose(:pages) { Page.includes(:category) }
  expose_decorated(:category, attributes: :category_params)
end
