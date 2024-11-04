class ReporteMailer < ApplicationMailer
  def reporte_notification(reporte)
    @reporte = reporte
    mail(to: "darwingx990@gmail.com", subject: "Reporte actualizado")
  end
end
