class Category < ActiveRecord::Base
  has_many :pages
  validates :id, :category, presence: true
end
