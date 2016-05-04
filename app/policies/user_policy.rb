class UserPolicy < ApplicationPolicy
  def index?
    @user.administrator?
  end
end
