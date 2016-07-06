class Comment < ActiveRecord::Base
  paginates_per 2

  validates :body, presence: true

  belongs_to :author, class_name: "User", foreign_key: :user_id
  belongs_to :page
  has_many :notifications
end
