class CategoryPolicy < ApplicationPolicy
  def create?
    user.present? && user.administrator?
  end

  def destroy?
    user.present? && user.administrator?
  end

  def index?
    user.present? && user.administrator?
  end
end
