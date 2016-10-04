class PagePolicy < ApplicationPolicy
  def destroy?
    owner?
  end

  def update?
    owner?
  end

  def create?
    admin?
  end

  def like?
    user && record.user != user
  end

  alias_method :new?, :create?

  private

  def owner?
    user.admin? && record.user == user
  end
end
