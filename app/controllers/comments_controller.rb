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

        notify if comment.body.include?("@")
        add_hashtags if comment.body.include?("#")
        format.html{ redirect_to comment.page, notice: "Comment was successfully created." }

      else
        format.html { render :new }
      end
    end
  end

  def update
    authorize comment

    respond_to do |format|
      if comment.save
        add_hashtags if comment.body.include?("#")
        format.html { redirect_to comment.page, notice: "Comment was successfully updated." }
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
        format.html { redirect_to root_path, notice: "Comment was successfully deleted." }
      else
        format.html { render :edit }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :page_id)
  end

  def notify
    mention = comment.body.scan(/@\w+/)
    mention.uniq!

    mention.each do |man|
      man = man.slice(1..man.length)
      Notification.create(comment_id: comment.id,
                          user_id: User.where(nickname: man).ids.first)
    end
  end

  def add_hashtags
    hashes = comment.body.scan(/#\w+/)
    hashes.uniq!

    hashes.each do |hash|
      hash = hash.slice(1..hash.length)
      hashtag = Hashtag.where(hashtag: hash).first

      if hashtag.nil?
        h = Hashtag.new
        h.hashtag = hash
        h.pages = []
        h.pages << comment.page_id
        h.save
      else
        unless hashtag.pages.include?(comment.page_id)
          hashtag.pages << comment.page_id
          hashtag.save
        end
      end
    end
  end
end
