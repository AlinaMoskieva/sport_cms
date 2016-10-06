module Pages
  class LikesController < ApplicationController
    respond_to :json
    expose(:like)
    expose(:page)

    def create
      like.likeable_id = page.id
      like.likeable_type = "Page"
      like.user = current_user
      like.save
      respond_with like, location: nil
    end
  end
end
