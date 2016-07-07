class CategoryPolicy < ApplicationPolicy
  def create?
    admin?
  end

  def destroy?
    admin?
  end

  def index?
    admin?
  end
end
