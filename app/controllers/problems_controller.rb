class ProblemsController < ApplicationController
  def create
    @problem = Problem.new(problem_params)
    @problem.save
  end

  private

  def problem_params
    params.require(:problem).permit(:problem_type_id, :problem_date, :info, :video_url, :latitude, :longitude)
  end
end
