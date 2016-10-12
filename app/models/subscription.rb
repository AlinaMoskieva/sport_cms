class Subscription < ActiveRecord::Base
  validates :user, :category, presence: true
  validates :user, uniqueness: { scope: :category }

  belongs_to :user, counter_cache: :subscriptions_count
  belongs_to :category
end
