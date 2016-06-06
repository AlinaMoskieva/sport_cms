class ResultPolicy < ApplicationPolicy
  def create?
    !@user.nil? && @user.administrator?
  end

  def destroy?
    !@user.nil? && @user.administrator?
  end

end
