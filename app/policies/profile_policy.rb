class ProfilePolicy < ApplicationPolicy
  def index?
    user.administrator?
  end
end
