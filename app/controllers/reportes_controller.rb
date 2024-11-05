class ReportesController < ApplicationController
  # before_action :set_reporte, only: [ :show, :update ]

  # POST /reportes
  def create
    @reporte = Reporte.new(reporte_params)
    if @reporte.save
      send_email(@reporte)  # Lógica para enviar correo
      render json: @reporte, status: :created
    else
      render json: @reporte.errors, status: :unprocessable_entity
    end
  end

  # GET /reportes
  def index
    @reportes = Reporte.all
    render json: @reportes
  end

  # PATCH/PUT /reportes/:id
  def update
    if @reporte.update(reporte_params)
      send_email(@reporte)  # Lógica para enviar correo
      render json: @reporte
    else
      render json: @reporte.errors, status: :unprocessable_entity
    end
  end

  private

  def set_reporte
    @reporte = Reporte.find(params[:id])
  end

  def reporte_params
    params.require(:reporte).permit(:nombre, :descripcion, :estado)
  end

  def send_email(reporte)
    ReporteMailer.reporte_notification(reporte).deliver_now
  end
end
