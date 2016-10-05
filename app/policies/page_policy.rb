class PagePolicy < ApplicationPolicy
  def create?
    admin?
  end

  def like?
    user.present?
  end

  alias_method :new?, :create?

  def owner?
    user.admin? && record.user == user
  end
end
