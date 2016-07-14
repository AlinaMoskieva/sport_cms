class ResultsController < ApplicationController
  expose(:result, attributes: :result_params)
  expose_decorated(:results) { Result.all.order(created_at: :desc).page params[:page] }
  expose(:categories) { Category.all }

  def index
  end

  def create
    authorize result
    result.save
    respond_with result, location: results_path
  end

  def destroy
    authorize result
    result.destroy
    respond_with result, location: results_path
  end

  def result_params
    params.require(:result).permit(:category_id, :country, :result, :prize,
      :first_team, :second_team, :first_team_result, :second_team_result,
      :first_team_members, :second_team_members, :first_team_country,
      :second_team_country, :sportsmen, :competition, :page_id)
  end
end
