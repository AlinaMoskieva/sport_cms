class HashtagsController < ApplicationController
  expose(:hashtag, attributes: :hashtag_params)
  expose(:hashtags) { Hashtag.all }
  expose(:pages) { pages_finder }

  def index
  end

  def show
  end

  private

  def hashtag_params
    params.require(:hashtag).permit(:hashtag, :pages)
  end

  def pages_finder
    Page.includes(:category)
        .includes(:user)
        .where(id: hashtag.pages).page params[:page]
  end
end
