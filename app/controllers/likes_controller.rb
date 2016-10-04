class LikesController < ApplicationController
  expose(:like)

  def create
    like.user = current_user
    like.save
    respond_with like, location: nil
  end
end
