class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  private 

  def render_not_acceptable
    render json: { errors: "Not acceptable" },
      status: :not_acceptable
  end

  def render_forbidden
    render json: { errors: "Forbidden" },
      status: :forbidden
  end

  def render_not_found
    render json: { error: "Not Found" },
    status: :not_found
  end
end
