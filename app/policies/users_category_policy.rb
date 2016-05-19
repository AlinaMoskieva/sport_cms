class UsersCategoryPolicy < ApplicationPolicy
  def create?
    @user.nil? ? false : true
  end
end
