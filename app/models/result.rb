class Result
  include Mongoid::Document

  field :category_id, type: String
  field :country, type: String
  field :result, type: String
  field :prize, type: String
  field :first_team, type: String
  field :second_team, type: String
  field :first_result, type: String
  field :second_result, type: String
  field :first_crew_members, type: String
  field :second_crew_members, type: String
  field :first_team_country, type: String
  field :second_team_country, type: String

  validates_presence_of :category_id

  has_one :page
end
