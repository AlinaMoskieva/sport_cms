class ResultDecorator < ApplicationDecorator
  delegate :country,
           :result,
           :prize,
           :sportsmen,
             :first_team,
             :second_team,
             :first_team_result,
             :second_team_result,
             :first_team_members,
             :second_team_members,
             :first_team_country,
             :second_team_country

  def get_category
    Category.find(object.category_id).category
  end

  def get_date
    object.created_at.strftime("%m.%d.%Y at %I:%M%P")
  end

  def winner?
    object.result.to_i < 4
  end

  def is_individual_sport?
    object.first_team.blank? || object.second_team.blank? ||
    object.first_team_result.blank? || object.second_team_result.blank?
  end
end
