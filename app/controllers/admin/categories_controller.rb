module Admin
  class CategoriesController < ApplicationController
    expose(:categories) { Category.all }
    expose(:pages) { Page.includes(:category) }
  end
end
