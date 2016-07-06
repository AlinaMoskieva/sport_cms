class User < ActiveRecord::Base
  enum role: [ :user, :admin ]

  paginates_per 2

  mount_uploader :image, ImageUploader

  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  before_save :default_values

  validates :full_name, presence: true
  validates :nickname, uniqueness: true

  has_many :pages
  has_many :comments
  has_many :notifications

  serialize :subscribed_categories

  def default_values
    self.role ||= 0
  end

  def administrator?
    self.admin?
  end
end
