class ResultsController < ApplicationController
  expose(:result, attributes: :result_params)
  expose(:results) { Result.all.order(created_at: :desc) }
  expose(:categories) { Category.all }

  def index
    @results = Result.all
  end

  def create
    authorize result

    result = Result.new(result_params)

    respond_to do |format|
      if result.save
        format.html{ redirect_to :back, notice: "The person has been created!" }
      else
        format.html{ render 'new' }
      end
    end
  end

  def show
  end

  def result_params
    params.require(:result).permit(:category_id,
                                   :country,
                                   :result,
                                   :prize,
                                   :first_team,
                                   :second_team,
                                   :first_team_result,
                                   :second_team_result,
                                   :first_team_members,
                                   :second_team_members,
                                   :first_team_country,
                                   :second_team_country,
                                   :created_at)
  end
end
