module Admin
  class CategoriesController < ApplicationController
    expose_decorated(:categories) { Category.all.order(:id) }
    expose(:pages) { Page.includes(:category) }
    expose_decorated(:category, attributes: :category_params)

    def create
      if category.save
        redirect_to admin_categories_url
        flash[:notice] = 'Category was successfully created.'
      else
        redirect_to admin_categories_url
        flash[:notice] = 'Errors.'
      end
    end

    def destroy
      if category.destroy
        redirect_to admin_categories_url
        flash[:notice] = 'Category was successfully deleted.'
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
