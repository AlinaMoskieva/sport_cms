class NotificationsController < ApplicationController
  expose(:notification, attributes: :notification_params)
  expose(:notifications)

  def index
  end

  private

  def notification_params
    params.require(:notification).permit(:comment_id, :user_id)
  end
end
