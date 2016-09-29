class ResultsController < ApplicationController
  expose(:result, attributes: :result_params)
  expose_decorated(:results) { |default| default.order(created_at: :desc).page params[:page] }
  expose(:categories)

  def destroy
    authorize result, :manage?
    result.destroy
    respond_with result, location: results_path
  end
end
