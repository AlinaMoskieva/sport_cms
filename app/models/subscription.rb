class Subscription < ActiveRecord::Base
  validates :user, :category, presence: true

  belongs_to :user, counter_cache: :subscriptions_count
  belongs_to :category
end
