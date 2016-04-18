class CommentPolicy < ApplicationPolicy
  def create?
    @user.role != nil
  end

  def update?
    @user.role != nil && @record.user == @user
  end

  def destroy?
    @user.role != nil && @record.user == @user
    # || @page.user ==@user -???
  end
end
