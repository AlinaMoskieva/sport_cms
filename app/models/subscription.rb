class Subscription < ActiveRecord::Base
  belongs_to :users
  belongs_to :category

  validates :user_id, :category_id, presence: true
end
