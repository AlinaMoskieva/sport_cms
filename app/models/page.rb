class Page < ActiveRecord::Base
  validates :title, :body, :user_id, :category_id, presence: true

  belongs_to :user
  belongs_to :category
  has_many :comments

  def data_format
    created_at.strftime("%m/%d/%Y at %I:%M%p ")
  end
end
