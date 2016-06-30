class ResultPolicy < ApplicationPolicy
  def create?
    @user.present? && @user.administrator?
  end

  def destroy?
    @user.present? && @user.administrator?
  end
end
