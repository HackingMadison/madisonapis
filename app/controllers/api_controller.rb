class ApiController < ApplicationController

  def index
    set_initial_scope
    paginate
    render_json
  end

  private

  def set_initial_scope
    @records = klass.unscoped
    @records = klass.near(params[:location].split(",").map(&:to_f), params[:distance] || 1) if params[:location]
  end

  def paginate
    @records = @records.page(params[:page]).per(25)
  end

  def render_json
    render json: @records, meta: { total_records: @records.total_count,
                                   current_page: @records.current_page,
                                   total_pages: @records.total_pages,
                                   per_page: 25 }
  end

  def klass
    @klass ||= controller_name.capitalize.singularize.constantize
  end

end
