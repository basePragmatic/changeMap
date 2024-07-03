require "bunny"

class RabbitmqSender
  def self.send_transaction(transaction_id)
    connection = Bunny.new
    connection.start

    channel = connection.create_channel
    quene = channel.queue("transactions")

    channel.default_exchange.publish(transaction_id.to_s, routing_key: quene.name)
    connection.close
  end
end
