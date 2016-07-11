class NotificationDecorator < ApplicationDecorator
  decorates_association :comment

  private :comment

  delegate :recepient
  delegate :full_name, to: :recepient, prefix: true
  delegate :page, :body, to: :comment, prefix: true

  def sender_name
    comment.author_full_name
  end

  def sender_email
    comment.author_email
  end

  def date
    object.created_at.strftime("%m.%d.%Y at %I:%M%P")
  end

  def sender_photo
    comment.author_image
  end
end
