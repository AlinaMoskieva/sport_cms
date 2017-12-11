class User < ActiveRecord::Base
  enum role: { user: "user", admin: "administrator" }

  paginates_per 7

  mount_uploader :image, ImageUploader

  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  validates :full_name, presence: true
  validates :nickname, uniqueness: true

  has_many :pages
  has_many :comments
  has_many :notifications, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :likes, dependent: :destroy

  def administrator?
    self.admin?
  end

  def unsubscribed?(category_id)
    Subscription.find_by(category_id: category_id, user_id: id).nil?
  end
end
