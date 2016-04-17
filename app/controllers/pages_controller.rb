class PagesController < ApplicationController
  expose(:page)
  expose(:pages) { Page.all }

  def create
    if  page.save
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


  def page_params
    params.require(:page).permit(:title, :body, :position, :theme, :user_id)
  end
end
