class NotificationsController < ApplicationController
  respond_to :html

  expose(:notification, attributes: :notification_params)
  expose_decorated(:notifications) { Notification.where(user_id: current_user.id)
                                                 .order(created_at: :desc)
                                                 .page params[:page] }

  private

  def notification_params
    params.require(:notification).permit(:comment_id, :user_id)
  end
end
