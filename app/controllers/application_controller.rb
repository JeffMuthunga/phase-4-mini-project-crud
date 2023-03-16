class ApplicationController < ActionController::API
  include ActionController::Cookies
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_error

  private
  def render_not_found_error
    render json: {error: "#{controller_name.classify} not found"}, status: 404
  end

end
