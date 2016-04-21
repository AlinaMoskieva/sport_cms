class PagePolicy < ApplicationPolicy

  def destroy?
    @user.administrator? && @record.user == @user
  end

  def update?
    @user.administrator? && @record.user == @user
  end

  def create?
    @user.administrator?
  end
end
