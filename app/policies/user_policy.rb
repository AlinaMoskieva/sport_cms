class UserPolicy < ApplicationPolicy
  def index?
    @user.administrator?
  end

  def create_subscription?
    @user.present?
  end

  def destroy_subscription?
    @user.present?
  end
end
