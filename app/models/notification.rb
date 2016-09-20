class Notification < ActiveRecord::Base
  paginates_per 5

  validates :comment, :recepient, presence: true

  belongs_to :recepient, class_name: "User", foreign_key: :user_id
  belongs_to :comment
end
