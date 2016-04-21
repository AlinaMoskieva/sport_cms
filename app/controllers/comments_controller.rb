class CommentsController < ApplicationController
  respond_to :html

  expose(:comment, attributes: :comment_params)
  expose(:comments) { Comment.page(params[:page]) }

  def create
    authorize comment

    page = Page.find(params[:page_id])
    comment.user = current_user
    comment.page_id = page.id

    if comment.save
      redirect_to comment.page
      flash[:notice] = 'Comment was successfully created.'
    else
      render :new
    end
  end

  def update
    authorize comment

    if comment.save
      redirect_to comment.page
      flash[:notice] = 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize comment

    if comment.delete
      redirect_to(root_path)
      flash[:notice] = 'Comment was successfully deleted.'

    else
      render :edit
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :page_id)
  end
end
