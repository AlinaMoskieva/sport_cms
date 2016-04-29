module Admin
  class CategoriesController < ApplicationController
    expose(:categories) { Category.all }
    expose(:pages) { Page.includes(:category) }
    expose(:category, attributes: :category_params)

    def create
      #category = Category.new(category_params)
      if category.save
        redirect_to admin_categories_url
        flash[:notice] = 'Category was successfully created.'
      else
        redirect_to admin_categories_url
        flash[:notice] = 'Errors.'
      end
    end

    def category_params
      params.require(:category).permit(:category, :id)
    end
  end
end
