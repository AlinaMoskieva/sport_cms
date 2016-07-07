class UserPolicy < ApplicationPolicy
  def index?
    user.present? && user.administrator?
  end

  def show?
    user.present? && user.administrator?
  end

  def create_subscription?
    user.present?
  end

  def destroy_subscription?
    user.present?
  end

  def update?
    user.present? && user.administrator?
  end

  alias_method  :edit?, :update?
end
