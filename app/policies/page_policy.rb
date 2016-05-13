class PagePolicy < ApplicationPolicy

  def destroy?
    @user.nil? || @user.administrator? && @record.user == @user
  end

  def update?
    @user.nil? || @user.administrator? && @record.user == @user
  end

  def create?
   @user.nil? ||  @user.administrator?
  end
end
