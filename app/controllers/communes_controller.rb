class CommunesController < ApplicationController
  before_action :set_commune, only: [:show, :update]

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

  def update
    render_not_found and return if @commune.nil?
    render_bad_request and return if params[:commune].nil?
    if @commune.update(commune_params)
      render_no_content and return
    else
      render_error(@commune)
    end
  end

  private

  def set_commune
    @commune = Commune.find_by(code_insee: params[:id])
  end

  def commune_params
    params.require(:commune).permit(:name)
  end
end
