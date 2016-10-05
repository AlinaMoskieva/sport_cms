class CommentPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def update?
    owner?
  end

  def destroy?
    owner?
  end

  def like?
    user.present?
  end

  private

  def owner?
    user.present? && record.author == user
  end
end
