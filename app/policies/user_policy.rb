class UserPolicy < ApplicationPolicy
  def index?
    @user.administrator?
  end

  alias show? index?

  def create_subscription?
    @user.present?
  end

  def destroy_subscription?
    @user.present?
  end

  def update?
    @user.administrator?
  end

  alias edit? update?
end
