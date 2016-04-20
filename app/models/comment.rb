class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :page
  validates :body, presence: true
end
