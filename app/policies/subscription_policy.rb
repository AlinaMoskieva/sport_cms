class SubscriptionPolicy < ApplicationPolicy
  def subscribed?
    Subscription.where(category_id: record.category_id, user_id: user.id).empty?
  end

  def create?
    user.present?
  end

  def destroy?
    user.present? && record.user_id == user.id
  end
end
