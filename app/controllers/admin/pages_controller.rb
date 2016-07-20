module Admin
  class PagesController < ApplicationController
    expose_decorated(:page, attributes: :page_params)
    expose_decorated(:categories)
    expose_decorated(:users)
    before_action :authorize_resource

    def create
      page.user = current_user
      Pages::Submit.call(page: page)
      respond_with page, location: page
    end

    private

    def page_params
      params.require(:page).permit(:title, :body, :user_id, :category_id, :visitors)
    end

    def authorize_resource
      authorize page
    end
  end
end
