class Category < ActiveRecord::Base
  validates :category, presence: true

  paginates_per 7

  has_many :pages
  has_many :results
  has_many :subscriptions, dependent: :destroy
end
