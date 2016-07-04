class NotificationDecorator < ApplicationDecorator
  delegate :comment
  delegate :full_name, to: :comment, prefix: true

  def sender
    object.comment.user.full_name
  end

  def sender_email
    object.comment.user.email
  end

  def comment
    object.comment.body.html_safe
  end

  def date
    object.created_at.strftime("%m.%d.%Y at %I:%M%P")
  end

  def photo
    object.comment.user.image
  end

  def page
    object.comment.page
  end
end
