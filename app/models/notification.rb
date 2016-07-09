class Notification < ActiveRecord::Base
  belongs_to :recepient, class_name: "User", foreign_key: :user_id
  belongs_to :comment
  validates :comment, :recepient, presence: true
  paginates_per 5
end
