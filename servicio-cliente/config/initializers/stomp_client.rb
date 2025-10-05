require 'stomp'

class StompClient
  def self.publish(queue, message)
    client = Stomp::Client.new("tcp://admin:admin@activemq:61613")
    client.publish(queue, message)
    client.close
  end
end
