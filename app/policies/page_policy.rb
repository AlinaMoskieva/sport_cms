class PagePolicy < ApplicationPolicy
  def create?
    admin?
  end

  def like?
    user.present?
  end

  alias_method :new?, :create?

  def manage?
    user.admin? && record.user == user
  end
end
