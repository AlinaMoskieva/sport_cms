class Result
  include Mongoid::Document

  field :category_id, type: String
  field :country, type: String
  field :result, type: String
  field :prize, type: String
end
