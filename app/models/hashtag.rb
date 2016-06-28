class Hashtag < ActiveRecord::Base
  serialize :pages
  validates :hashtag, uniqueness: true

  belongs_to :page
end
