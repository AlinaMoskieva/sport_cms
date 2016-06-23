class Comment < ActiveRecord::Base
  paginates_per 2

  validates :body, presence: true

  belongs_to :user
  belongs_to :page
  has_many :notifications
end
