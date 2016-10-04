class UserPolicy < ApplicationPolicy
  def manage?
    admin?
  end
end
