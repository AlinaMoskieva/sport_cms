class User < ActiveRecord::Base
  enum role: { user: "user", admin: "administrator" }

  paginates_per 2

  mount_uploader :image, ImageUploader

  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  validates :full_name, presence: true
  validates :nickname, uniqueness: true

  has_many :pages
  has_many :comments
  has_many :notifications
  has_many :subscriptions

  def administrator?
    self.admin?
  end

  def subscribed?(category_id)
    Subscription.where(category_id: category_id, user_id: self.id).empty?
  end
end
