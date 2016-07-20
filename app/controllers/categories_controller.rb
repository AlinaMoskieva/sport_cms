class CategoriesController < ApplicationController
  expose_decorated(:categories) { |default| default.order(:category) }
  expose_decorated(:category, attributes: :category_params)
end
