module Comments
  class LikesController < ApplicationController
    respond_to :json
    expose(:comment)
    expose(:likes, ancestor: :comment)
    expose(:like)

    def create
      like.user = current_user
      like.save
      respond_with like, location: nil
    end
  end
end
