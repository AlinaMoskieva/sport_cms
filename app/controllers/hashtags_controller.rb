class HashtagsController < ApplicationController
  expose(:hashtag, attributes: :hashtag_params)
  expose(:hashtags) { Hashtag.all }
  expose_decorated(:pages) { pages_finder }

  private

  def hashtag_params
    params.require(:hashtag).permit(:hashtag, :pages)
  end

  def pages_finder
    Page.includes(:category, :user)
      .where(id: hashtag.pages).page params[:page]
  end
end
