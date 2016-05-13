class CommentPolicy < ApplicationPolicy
  def create?
    ! @user.nil?
  end

  def update?
    @user.nil? || @record.user == @user
  end

  def destroy?
    @user.nil? ||  @record.user == @user
    # || @page.user ==@user -???
  end
end
