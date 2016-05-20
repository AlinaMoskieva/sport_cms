class ResultsController < ApplicationController
  expose(:result)
  ## TODO expose
  expose(:categories) { Category.all }

  def index
    @results = Result.all
  end

  def show
    binding.pry
  end
end
