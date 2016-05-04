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
    params.require(:page).permit( :title, :body, :user_id, :category_id)
  end
end
