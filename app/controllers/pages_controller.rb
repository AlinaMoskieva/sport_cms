class PagesController < ApplicationController
  expose(:page, attributes: :page_params)
  expose(:pages) { Page.all.order(created_at: :desc).includes(:user) }

  def create
    page.user = current_user

    if page.save
      redirect_to(page)
    else
      render :new
    end
  end

  def update
    if page.save
      redirect_to(page)
    else
      render :edit
    end
  end

  def destroy
    if page.destroy
      redirect_to root_path
    else
      render :edit
    end
  end

  def page_params
    params.require(:page).permit( :title, :body, :theme, :user_id)
  end
end
