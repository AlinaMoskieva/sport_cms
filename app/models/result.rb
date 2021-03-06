class Result
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  field :category_id, type: String
  field :country, type: String
  field :result, type: String
  field :prize, type: String
  field :first_team, type: String
  field :second_team, type: String
  field :first_team_result, type: String
  field :second_team_result, type: String
  field :first_team_members, type: String
  field :second_team_members, type: String
  field :first_team_country, type: String
  field :second_team_country, type: String
  field :sportsmen, type: String
  field :competition, type: String
  field :page_id, type: String

  paginates_per 5

  validates :category_id, presence: true

  has_one :page
  has_one :category
end
