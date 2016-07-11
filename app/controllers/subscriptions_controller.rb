class SubscriptionsController < ApplicationController
  expose(:subscription, attributes: :subscription_params)
  expose(:subscriptions)

  def create
    respond_to do |format|
      if subscription.save
        format.html { redirect_to :back, notice: "Created" }
      else
        format.html { redirect_to :back, notice: "Errors" }
      end
    end
  end

  def destroy
    respond_to do |format|
      if subscription.destroy
        format.html { redirect_to :back, notice: "Deleted" }
      else
        format.html { redirect_to :back, :notice: "Bad way"}
      endи
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:user_id, :category_id)
  end
end
