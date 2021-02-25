class CommunesController < ApplicationController
  before_action :set_commune, only: :show

  def index
    render_not_acceptable and return if params[:format] == 'html'
    @communes = Commune.to_hash
    render json: @communes
  end

  def show
    render_not_found and return if @commune.nil?
    render json: { code_insee: @commune.code_insee, name: @commune.name }
  end
  
  def create
    render_forbidden and return
  end

  private

  def set_commune
    @commune = Commune.find_by(code_insee: params[:id])
  end
end
