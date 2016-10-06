module Comments
  class LikesController < ApplicationController
    respond_to :json
    expose(:like)
    expose(:comment)

    def create
      like.likeable_id = comment.id
      like.likeable_type = "Comment"
      like.user = current_user
      like.save
      respond_with like, location: nil
    end
  end
end
