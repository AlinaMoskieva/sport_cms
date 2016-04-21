class User < ActiveRecord::Base
  before_save :default_values
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable
  has_many :page
  has_many :comments
  validates :full_name, presence: true

  def default_values
    self.role ||= 'user'
  end

  def administrator?
    self.role == "administrator"
  end
end
