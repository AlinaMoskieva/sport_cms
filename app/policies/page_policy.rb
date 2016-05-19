class PagePolicy < ApplicationPolicy

  def destroy?
    @user.nil? ? false : @user.administrator? && @record.user == @user
  end

  def update?
    @user.nil? ? false : @user.administrator? && @record.user == @user
  end

  def create?
    @user.nil? ? false : @user.administrator?
  end
end
