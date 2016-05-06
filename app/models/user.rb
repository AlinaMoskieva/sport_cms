class User < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  before_save :default_values
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable
  has_many :pages
  has_many :comments
  validates :full_name, presence: true

  def default_values
    self.role ||= 'user'
  end

  def administrator?
    self.role == "administrator"
  end
end
