class PagesController < ApplicationController
  expose_decorated(:page, attributes: :page_params)
  expose_decorated(:comments) { page.comments.includes(:user) }

  def index
    @pages = Page.includes(:user).order(created_at: :desc)
  end

  def create
    page.user = current_user

    authorize page

    if page.save
      redirect_to(page)
      flash[:notice] = 'Page was successfully created.'
    else
      render :new
    end
  end

  def update
    authorize page

    if page.save
      redirect_to(page)
      flash[:notice] = 'Page was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize page

    if page.destroy
      redirect_to root_path
      flash[:notice] = 'Page was successfully deleted.'
    else
      render :edit
    end
  end

  def page_params
    params.require(:page).permit( :title, :body, :theme, :user_id)
  end
end
