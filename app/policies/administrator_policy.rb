class AdministratorPolicy < ApplicationPolicy
  def index?
    @user.administrator?
  end
end
