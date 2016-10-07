module Pages
  class LikesController < ApplicationController
    respond_to :json

    expose(:page)
    expose(:likes, ancestor: :page)
    expose(:like)

    def create
      like.user = current_user
      like.save
      respond_with like, location: nil
    end
  end
end
