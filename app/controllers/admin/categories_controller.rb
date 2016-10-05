module Admin
  class CategoriesController < ApplicationController
    expose_decorated(:categories) { |categories| categories.order(:id).page params[:page] }
    expose_decorated(:category, attributes: :category_params)
    before_action :authorize_resource

    def create
      category.save
      respond_with category, location: admin_categories_path
    end

    def destroy
      category.destroy
      respond_with category, location: admin_categories_path
    end

    private

    def category_params
      params.require(:category).permit(:category)
    end

    def authorize_resource
      authorize category, :manage?
    end
  end
end
