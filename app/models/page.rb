class Page < ActiveRecord::Base
  paginates_per 5
  validates :title, :body, :user_id, :category_id, presence: true

  belongs_to :user
  belongs_to :category, counter_cache: :pages_count
  has_many :comments
  has_one :result
  has_many :hashtags

  def data_format
    created_at.strftime("%m/%d/%Y at %I:%M%p ")
  end
end
