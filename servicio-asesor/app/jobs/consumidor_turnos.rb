require 'stomp'
require 'redis'
require 'json'

class ConsumidorTurnos
  def self.iniciar
    client = Stomp::Client.new("tcp://admin:admin@activemq:61613")
    redis = Redis.new(host: "redis", port: 6379)

    client.subscribe("/queue/turnos") do |msg|
      turno = JSON.parse(msg.body)
      redis.lpush("turnos_atendidos", turno.to_json)
      puts "Turno atendido: #{turno}"
    end

    loop do
      sleep 1
    end
  end
end
