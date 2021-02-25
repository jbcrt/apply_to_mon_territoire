class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  private 

  def render_not_acceptable
    render json: { errors: "Not acceptable" },
      status: :not_acceptable
  end
end
