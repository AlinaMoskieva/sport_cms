class UserPolicy < ApplicationPolicy
  def index?
    @user.administrator?
  end

  def create_subscription?
    @user.nil? ? false : true
  end

  def destroy_subscription?
    @user.nil? ? false : true
  end
end
