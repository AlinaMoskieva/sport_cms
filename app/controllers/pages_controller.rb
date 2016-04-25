class PagesController < ApplicationController
  expose_decorated(:page, attributes: :page_params)
  expose_decorated(:comments) { page.comments.includes(:user) }
  expose(:category){ Category.all}
  expose_decorated(:users) { User.all }

  def index
    @pages = Page.includes(:category).includes(:user).order(created_at: :desc)
    @pages = @pages.where(category_id: params[:category_id] ) if params[:category_id]
    @pages = @pages.where(user_id: params[:user_id] ) if params[:user_id]
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
    params.require(:page).permit( :title, :body, :user_id, :category_id)
  end
end
