class Api::ParksController < ApplicationController

  def index
    @records = Park.unscoped
    @records = @records.near(params[:location].split(",").map(&:to_f), params[:distance] || 1) if params[:location]
    @records = @records.page(params[:page]).per(25)
    render json: @records, meta: { total_records: @records.total_count,
                                 current_page: @records.current_page,
                                 total_pages: @records.total_pages,
                                 per_page: 25 }
  end

end
