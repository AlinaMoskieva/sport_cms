class ResultPolicy < ApplicationPolicy
  def manage?
    admin?
  end
end
