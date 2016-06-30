class NotificationDecorator < ApplicationDecorator
  def sender
    User.find(Comment.find(object.comment_id).user_id).full_name
  end

  def sender_email
    User.find(Comment.find(object.comment_id).user_id).email
  end

  def comment
    Comment.find(object.comment_id).body.html_safe
  end

  def date
    object.created_at.strftime("%m.%d.%Y at %I:%M%P")
  end

  def photo
    User.find(Comment.find(object.comment_id).user_id).image
  end

  def page
    Page.find(Comment.find(object.comment_id).page_id)
  end
end
