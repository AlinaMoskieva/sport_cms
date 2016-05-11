class PagesController < ApplicationController
  expose_decorated(:page, attributes: :page_params)
  expose_decorated(:comments) { page.comments.includes(:user) }
  expose_decorated(:categories){ Category.all}
  expose_decorated(:users) { User.all }
  expose(:subscribed_pages){ pages_finder }

  def index
    if params[:format]
      @pages = subscribed_pages
    else
      @pages = Page.includes(:category).includes(:user).order(created_at: :desc)
      @pages = @pages.where(category_id: params[:category_id] ) if params[:category_id]
      @pages = @pages.where(user_id: params[:user_id] ) if params[:user_id]
    end
  end

  def show
    page.increment(:visitors)
    page.save
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
    params.require(:page).permit( :title, :body, :user_id, :category_id, :visitors)
  end

  private

  def pages_finder
    Page.includes(:category)
        .includes(:user)
        .where(category_id: current_user.subscribed_categories)
  end
end
