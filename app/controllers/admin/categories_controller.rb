module Admin
  class CategoriesController < ApplicationController
    expose_decorated(:categories) { |categories| categories.order(:id) }
    expose_decorated(:category, attributes: :category_params)
    before_action :authorize_resource

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

    private

    def category_params
      params.require(:category).permit(:category, :id)
    end

    def authorize_resource
      authorize category
    end
  end
end
