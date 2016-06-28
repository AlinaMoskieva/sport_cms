class CommentPolicy < ApplicationPolicy
  def create?
    @user.present?
  end

  def update?
    owner?
  end

  def destroy?
    owner?
  end

  private

  def owner?
    return false unless @user.present?
    @record.user == @user
  end
end
