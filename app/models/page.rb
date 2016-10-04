class Page < ActiveRecord::Base
  paginates_per 5
  validates :title, :body, :user_id, :category_id, presence: true

  belongs_to :user, counter_cache: :pages_count
  belongs_to :category, counter_cache: :pages_count
  has_many :comments, dependent: :destroy
  has_one :result
  has_many :pages_hashtags
  has_many :hashtags, through: :pages_hashtags
  has_many :likes, as: :likeable, dependent: :destroy
end
