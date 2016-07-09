module Admin
  class CategoriesController < ApplicationController
    before_action :authorization_admin
    expose_decorated(:categories) { Category.includes(:pages).order(:id) }
    expose(:pages) { Page.includes(:category) }
    expose_decorated(:category, attributes: :category_params)

    def create
      respond_to do |format|
        if category.save
          format.html { redirect_to admin_categories_url, notice: "Created." }
        else
          format.html { redirect_to admin_categories_url, notice: "Errors." }
        end
      end
    end

    def destroy
      respond_to do |format|
        if category.destroy
          format.html { redirect_to admin_categories_url, notice: "Deleted." }
        else
          format.html { redirect_to admin_categories_url, notice: "Errors." }
        end
      end
    end

    def category_params
      params.require(:category).permit(:category, :id)
    end
  end
end
