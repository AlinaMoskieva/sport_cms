class Like < ActiveRecord::Base
  belongs_to :likeable, polymorphic: true
  belongs_to :user

  validates :user, uniqueness: { scope: %i(likeable_id likeable_type) }
  validates :likeable_id, :likeable_type, :user, presence: true
end
