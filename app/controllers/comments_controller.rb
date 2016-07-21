class CommentsController < ApplicationController
  respond_to :html, :js

  expose(:comment, attributes: :comment_params)
  expose(:comments) { |default| default.page(params[:page]).page params[:page] }
  expose(:page)

  before_action :authorize_resource

  def create
    comment.author = current_user
    comment.page_id = page.id
    Comments::Submit.call(comment: comment)
    respond_with comment, location: comment.page
  end

  def update
    Comments::Submit.call(comment: comment)
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
