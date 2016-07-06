class PagePolicy < ApplicationPolicy
  def destroy?
    owner?
  end

  def update?
    owner?
  end

  def create?
    @user.present? && @user.administrator?
  end

  alias_method :new?, :create?

  private

  def owner?
    return false unless @user.present?
    @user.administrator? && @record.user == @user
  end
end
