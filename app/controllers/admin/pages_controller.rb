module Admin
  class PagesController < ApplicationController
    expose_decorated(:page, attributes: :page_params)
    expose_decorated(:categories)
    expose_decorated(:users)

    def new
      authorize page
    end

    def create
      authorize page, :create?
      page.user = current_user
      Pages::Submit.call(page: page)
      respond_with page, location: page
    end

    private

    def page_params
      params.require(:page).permit(:title, :body, :user_id, :category_id, :visitors)
    end
  end
end
