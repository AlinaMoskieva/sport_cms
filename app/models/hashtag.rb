class Hashtag < ActiveRecord::Base
  validates :hashtag, uniqueness: true

  belongs_to :page
  has_many :pages_hashtags
  has_many :pages, through: :pages_hashtags
end
