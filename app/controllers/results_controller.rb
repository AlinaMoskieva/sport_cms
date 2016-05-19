class ResultsController < ApplicationController
  expose(:result)
  expose(:results) { Result.all }
  expose(:categories) { Category.all }
end
