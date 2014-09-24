class PanelController < ApplicationController
  def index
    @problems = Problem.all
    @hash = Gmaps4rails.build_markers(@problems) do |problem, marker|
      marker.lat problem.latitude
      marker.lng problem.longitude
    end
  end
end
