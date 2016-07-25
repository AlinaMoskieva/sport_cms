module Notifications
  class Notify
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
        notification = Notification.new(comment_id: comment.id, user_id: user_finder(man))
        notification.save || context.fail!(message: "Notification was not delivered")
      end
    end

    def user_finder(man)
      User.where(nickname: man.slice(1..man.length)).ids.first
    end
  end
end
