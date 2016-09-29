class PagePolicy < ApplicationPolicy
  def create?
    admin?
  end

  alias_method :new?, :create?

  def owner?
    user.admin? && record.user == user
  end
end
