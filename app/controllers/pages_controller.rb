class PagesController < ApplicationController
  expose_decorated(:page, attributes: :page_params)
  expose_decorated(:comments) { page.comments.includes(:user).page params[:page] }
  expose_decorated(:categories){ Category.all}

  expose_decorated(:users) { User.all }
  expose(:subscribed_pages){ pages_finder }

  def index
    if params[:format]
      @pages = subscribed_pages.page params[:page]
    else
      @pages = Page.includes(:category).includes(:user).order(created_at: :desc).page params[:page]
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

    authorize page, :create?

    respond_to do |format|
      if page.save
        format.html{ redirect_to page, notice: 'Page was successfully created.' }
      else
        format.html{ render :new }
      end
    end
  end

  def update
    authorize page, :update?

    respond_to do |format|
      if page.save
        format.html{ redirect_to page,notice: 'Page was successfully updated.' }
      else
        format.html{ render :edit }
      end
    end
  end

  def destroy
    authorize page, :destroy?

    respond_to do |format|
      if page.destroy
        format.html{ redirect_to root_path, notice: 'Page was successfully deleted.' }
      else
        format.html{ render :edit }
      end
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
