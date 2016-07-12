class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  validates :user, :category, presence: true
end
