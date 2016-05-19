class CommentPolicy < ApplicationPolicy
  def create?
    ! @user.nil?
  end

  def update?
    @user.nil? ? false : @record.user == @user
  end

  def destroy?
    @user.nil? ? false :  @record.user == @user
  end
end
