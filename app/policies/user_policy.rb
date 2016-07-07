class UserPolicy < ApplicationPolicy
  def index?
    user.administrator?
  end

  def show?
    user.administrator?
  end

  def create_subscription?
    user.present?
  end

  def destroy_subscription?
    user.present?
  end

  def update?
    user.administrator?
  end

  alias_method  :edit?, :update?
end
