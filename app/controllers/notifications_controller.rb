class NotificationsController < ApplicationController
  respond_to :html

  expose(:notification, attributes: :notification_params)
  expose(:notifications) { Notification.page(params[:page]) }

  def create
    notification.user_id = current_user.id
    flash[:notice] = 'Notification was successfully created.' if notification.save
    respond_with(notification)
  end

  def update
    flash[:notice] = 'Notification was successfully updated.' if notification.save
    respond_with(notification)
  end

  def destroy
    notification.destroy
    respond_with(notification)
  end

  private

  def notification_params
    params.require(:notification).permit(:comment_id, :user_id)
  end
end
