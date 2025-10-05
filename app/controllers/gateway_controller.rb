class GatewayController < ActionController::API
  require 'net/http'
  require 'json'

  # Ruta para redirigir solicitudes al servicio cliente
  def clientes
    uri = URI('http://servicio-cliente:3000')
    response = Net::HTTP.get_response(uri)
    render json: { status: response.code, body: response.body }
  end

  # Ruta para redirigir solicitudes al servicio asesor
  def asesores
    uri = URI('http://servicio-asesor:3001')
    response = Net::HTTP.get_response(uri)
    render json: { status: response.code, body: response.body }
  end
end
