class CommentsController < ApplicationController
  respond_to :html, :js

  expose(:comment, attributes: :comment_params)
  expose(:comments) { Comment.page(params[:page]).page params[:page] }

  def create
    authorize comment

    page = Page.find(params[:page_id])
    comment.author = current_user
    comment.page_id = page.id
    CreateComment.call(comment: comment)
    respond_with comment, location: comment.page
  end

  def update
    authorize comment
    CreateComment.call(comment: comment)
    respond_with comment, location: comment.page
  end

  def destroy
    authorize comment
    comment.destroy
    respond_with comment, location: comment.page
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :page_id)
  end
end
