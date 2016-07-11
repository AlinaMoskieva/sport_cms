class Subscription < ActiveRecord::Base
  belongs_to :users
  belongs_to :category_id

  validates :users, :category_id, presence: true
end
