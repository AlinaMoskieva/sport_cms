class NotificationsController < ApplicationController
  respond_to :html

  expose(:notification, attributes: :notification_params)
  expose_decorated(:notifications) { notifications_finder }
  def destroy
    respond_to do |format|
      if notification.delete
        format.html { redirect_to notifications_path, notice: "Notification was successfully deleted" }
      else
        format.html { render :back }
      end
    end
  end

  private

  def notification_params
    params.require(:notification).permit(:comment_id, :user_id)
  end

  def notifications_finder
    Notification.where(user_id: current_user.id)
      .order(created_at: :desc)
      .page params[:page]
  end
end
