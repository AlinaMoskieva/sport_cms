class PagePolicy < ApplicationPolicy
  def destroy?
    owner?
  end

  def subscribed?
    Subscription.where(category_id: record.category.id, user_id: user.id).empty?
  end

  def update?
    owner?
  end

  def create?
    admin?
  end

  alias_method :new?, :create?

  private

  def owner?
    user.admin? && record.user == user
  end
end
