class CommentsController < ApplicationController
  respond_to :html, :js

  expose(:comment, attributes: :comment_params)
  expose(:page)

  before_action :authorize_resource

  def create
    comment.author = current_user
    comment.page_id = page.id
    result = Comments::Submit.call(comment: comment)
    respond_with comment, location: comment.page
    flash[:notice] = result.message if result.failure?
  end


  def update
    result = Comments::Submit.call(comment: comment)
    respond_with comment, location: comment.page
    flash[:notice] = result.message if result.failure?
  end

  def destroy
    comment.destroy
    respond_with comment, location: comment.page
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def authorize_resource
    authorize comment
  end
end
