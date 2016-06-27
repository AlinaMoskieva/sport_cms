class HashtagsController < ApplicationController
  expose(:hashtag, attributes: :hashtag_params)
  expose(:hashtags) { Hashtag.all }

  def index
  end

  def show
  end

  private
  def hashtag_params
    params.require(:hashtag).permit(:hashtag, :pages)
  end
end
