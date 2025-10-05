class TurnosController < ApplicationController
  def create
    nombre = params[:nombre]
    turno = { id: SecureRandom.uuid, nombre: nombre, estado: "pendiente" }

    # Guardar en Redis
    redis = Redis.new(host: "redis", port: 6379)
    redis.lpush("turnos_pendientes", turno.to_json)

    # Publicar en ActiveMQ
    StompClient.publish("/queue/turnos", turno.to_json)

    render json: { mensaje: "Turno recibido", turno: turno }, status: :created
  end
end
