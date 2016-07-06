module Admin
  class CategoriesController < ApplicationController
    expose_decorated(:categories) { Category.includes(:pages).order(:id) }
    expose(:pages) { Page.includes(:category) }
    expose_decorated(:category, attributes: :category_params)
    before_action :authorize_resource

    def create
      respond_to do |format|
        if category.save
          format.html { redirect_to admin_categories_url,
            notice: "Category was successfully created." }
        else
          format.html { redirect_to admin_categories_url, notice: "Errors." }
        end
      end
    end

    def destroy
      respond_to do |format|
        if category.destroy
          format.html { redirect_to admin_categories_url,
            notice: "Category was successfully deleted." }
        else
          format.html { redirect_to admin_categories_url, notice: "Errors." }
        end
      end
    end

    def category_params
      params.require(:category).permit(:category, :id)
    end

    def authorize_resource
      authorize category
    end
  end
end
