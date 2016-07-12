class Subscription < ActiveRecord::Base
  belongs_to :user, counter_cache: :subscriptions_count
  belongs_to :category

  validates :user, :category, presence: true
end
