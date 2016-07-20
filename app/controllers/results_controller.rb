class ResultsController < ApplicationController
  expose(:result, attributes: :result_params)
  expose_decorated(:results) { Result.all.order(created_at: :desc).page params[:page] }
  expose(:categories) { Category.all }

  def destroy
    authorize result
    result.destroy
    respond_with result, location: results_path
  end
end
