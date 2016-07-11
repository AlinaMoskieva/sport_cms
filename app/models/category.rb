class Category < ActiveRecord::Base
  validates :category, presence: true

  has_many :pages
  has_many :results
end
