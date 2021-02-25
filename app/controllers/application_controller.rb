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

  def render_no_content
    render json: { errors: "No content" },
      status: :no_content
  end

  def render_bad_request
    render json: { error: "Bad Request" },
      status: :bad_request
  end

  def render_error(model)
    render json: { errors: model.errors.full_messages },
      status: :unprocessable_entity
  end
end
