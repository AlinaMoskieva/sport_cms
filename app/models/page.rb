class Page < ActiveRecord::Base
  validates :title, :body, :user_id, :theme, presence: true
  belongs_to :user
  has_many :comments
end
