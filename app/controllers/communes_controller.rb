class CommunesController < ApplicationController
  def index
    render_not_acceptable and return if params[:format] == 'html'
    @communes = Commune.to_hash
    render json: @communes
  end
end
