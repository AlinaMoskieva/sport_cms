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
  field :created_at, type: Date
  field :sportsmen,type: String

  validates_presence_of :category_id

  has_one :page

end
