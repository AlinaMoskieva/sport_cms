class ResultPolicy < ApplicationPolicy
  def create?
    !@user.nil? && @user.administrator?
  end
end
