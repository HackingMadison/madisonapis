class Api::ParksController < ApplicationController

  def index
    @parks = Park
    @parks = @parks.near(params[:location].split(",").map(&:to_f), params[:distance] || 1) if params[:location]
    render json: @parks.to_json
  end

end
