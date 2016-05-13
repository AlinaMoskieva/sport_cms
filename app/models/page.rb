class Page < ActiveRecord::Base
  paginates_per 5
  validates :title, :body, :user_id, :category_id, presence: true
  belongs_to :user
  has_many :comments
  belongs_to :category

  def data_format
    created_at.strftime("%m/%d/%Y at %I:%M%p ")
  end
end
