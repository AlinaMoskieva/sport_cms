class Category < ActiveRecord::Base
  has_many :pages
  validates  :category, presence: true
end
