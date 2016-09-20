class HashtagsController < ApplicationController
  expose_decorated(:hashtag, attributes: :hashtag_params)
  expose(:hashtags)
  expose_decorated(:pages) { pages_finder }

  private

  def hashtag_params
    params.require(:hashtag).permit(:hashtag)
  end

  def pages_finder
    Page.includes(:category, :user)
      .where(id: hashtag.pages).page params[:page]
  end
end
