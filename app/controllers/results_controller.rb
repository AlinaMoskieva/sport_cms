class ResultsController < ApplicationController
  expose(:result, attributes: :result_params)
  expose(:results) { Result.all }
  expose(:categories) { Category.all }

  def index
    @results = Result.all
  end

  def create
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
    params.require(:result).permit(:category_id, :country, :result, :prize)
  end
end
