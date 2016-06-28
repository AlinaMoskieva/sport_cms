class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :comment
  validates :comment_id, :user_id, presence: true
  paginates_per 5
end
