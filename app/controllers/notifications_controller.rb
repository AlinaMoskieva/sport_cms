class NotificationsController < ApplicationController
  respond_to :html

  expose(:notification, attributes: :notification_params)
  expose_decorated(:notifications) { notification_finder }

  def destroy
    notification.delete
    respond_with notification, location: -> { notifications_path }
  end

  private

  def notification_params
    params.require(:notification).permit(:comment_id, :user_id)
  end

  def notification_finder
    Notification.where(user_id: current_user.id)
      .includes(comment: %i(page author))
      .includes(:recepient)
      .order(created_at: :desc)
      .page params[:page]
  end
end
