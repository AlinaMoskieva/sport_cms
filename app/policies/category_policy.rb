class CategoryPolicy < ApplicationPolicy
  def create?
    user.administrator?
  end

  def destroy?
    user.administrator?
  end

  def index?
    user.administrator?
  end
end
