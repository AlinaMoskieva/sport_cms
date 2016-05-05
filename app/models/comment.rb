class Comment < ActiveRecord::Base
  paginates_per 2
  belongs_to :user
  belongs_to :page
  validates :body, presence: true
end
