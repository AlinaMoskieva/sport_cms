class ProfilePolicy < ApplicationPolicy
  def index?
    admin?
  end
end
