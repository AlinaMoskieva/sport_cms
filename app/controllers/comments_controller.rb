class CommentsController < ApplicationController
  respond_to :html, :js

  expose(:comment, attributes: :comment_params)
  expose(:comments) { Comment.page(params[:page]).page params[:page] }
  expose(:page)

  before_action :authorize_resource

  def create
    comment.author = current_user
    comment.page_id = page.id
    result = Comments::Submit.call(comment: comment, action: "create")
    respond_to do |format|
      if result.success?
        format.html { redirect_to comment.page, notice: "Comment created" }
      else
        format.html { redirect_to comment.page, notice: result.message }
      end
    end
  end

  def update
    result = Comments::Submit.call(comment: comment)
    respond_to do |format|
      if result.success?
        format.html { redirect_to comment.page, notice: "Comment updeted" }
      else
        format.html { render comment.page, notice: result.message }
      end
    end
    respond_with comment, location: comment.page
  end

  def destroy
    comment.destroy
    respond_with comment, location: comment.page
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :page_id)
  end

  def authorize_resource
    authorize comment
  end
end
