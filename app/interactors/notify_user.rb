class NotifyUser
  include Interactor

  delegate :comment, to: :context
  delegate :body, to: :comment

  def call
    create_notification
  end

  private

  def mention
    mention = body.scan(/@\w+/)
    mention.uniq
  end

  def create_notification
    mention.each do |man|
      Notification.create(comment_id: comment.id,
        user_id: User.where(nickname: man.slice(1..man.length)).ids.first)
    end
  end
end
