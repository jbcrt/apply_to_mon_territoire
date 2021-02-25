class CommunesController < ApplicationController
  def index
    render_not_acceptable and return if params[:format] == 'html'
    @communes = Commune.to_hash
    render json: @communes
  end
  
  def create
    render_forbidden and return
  end
end
