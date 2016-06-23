class CommentsController < ApplicationController
  respond_to :html, :js

  expose(:comment, attributes: :comment_params)
  expose(:comments) { Comment.page(params[:page]).page params[:page] }

  def create
    authorize comment

    page = Page.find(params[:page_id])
    comment.user = current_user
    comment.page_id = page.id

    respond_to do |format|
      if comment.save
        notify(comment.body) if comment.body.include?('@')
        format.html{ redirect_to comment.page, notice: 'Comment was successfully created.' }
      else
        format.html{ render :new }
      end
    end
  end

  def update
    authorize comment

    respond_to do |format|
      if comment.save
        format.html{ redirect_to comment.page, notice: 'Comment was successfully updated.' }
        format.js
        format.json { respond_with_bip(comment) }
      else
        format.html{ render :edit }
        format.js
        format.json { respond_with_bip(comment) }
      end
    end
  end

  def destroy
    authorize comment

    respond_to do |format|
      if comment.delete
        format.html{ redirect_to root_path, notice: 'Comment was successfully deleted.' }
      else
        format.html{ render :edit }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :page_id)
  end

  def notify(str)
    @str = str.slice((comment.body.index('@') + 1)..comment.body.length)
    @nick = @str.slice(0..(@str.index(' ').to_i - 1))
    @str = @str.slice((@str.index(@nick.last) - 1 )..comment.body.length)
    Notification.create(comment_id: comment.id,
      user_id: User.where(nickname: @nick).ids.first )
    notify(@str) if @str.include?('@')
  end
end
