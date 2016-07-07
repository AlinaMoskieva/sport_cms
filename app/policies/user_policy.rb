class UserPolicy < ApplicationPolicy
  def index?
    admin?
  end

  def show?
    admin?
  end

  def create_subscription?
    user.present?
  end

  def destroy_subscription?
    user.present?
  end

  def update?
    admin?
  end

  alias_method :edit?, :update?
end
