class PagesController < ApplicationController
  expose_decorated(:page, attributes: :page_params)
  expose_decorated(:comments) { page.comments.includes(:author).page params[:page] }
  expose_decorated(:categories)
  expose_decorated(:pages)
  expose_decorated(:users)

  def index
    self.pages = Page.includes(:category, :user).order(created_at: :desc).page params[:page]
    self.pages = pages.where(category_id: params[:category_id]) if params[:category_id]
    self.pages = pages.where(user_id: params[:user_id]) if params[:user_id]
  end

  def show
    page.increment(:visitors)
    page.save
  end

  def update
    authorize page, :update?
    result = Pages::Submit.call(page: page)
    respond_to do |format|
      if result.success?
        format.html { redirect_to page, notice: "Page updated" }
      else
        format.html { render page, notice: result.message }
      end
    end
  end

  def destroy
    authorize page, :destroy?
    page.destroy
    respond_with page, location: root_path
  end

  private

  def page_params
    params.require(:page).permit(:title, :body, :user_id, :category_id, :visitors)
  end
end
