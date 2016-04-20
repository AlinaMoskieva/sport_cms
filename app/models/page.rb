class Page < ActiveRecord::Base
  validates :title, :body, :user_id, :category_id, presence: true
  belongs_to :user
  has_many :comments
  has_one :category
end
