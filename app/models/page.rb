class Page < ActiveRecord::Base
  before_save :default_values
  validates :title, :body, :user_id, :theme, presence: true
  validates_inclusion_of :position , :in => ['top_menu', 'right_menu']
  belongs_to :user

  def default_values
    self.position ||= 'right_menu'
  end
end
