require 'bunny'

class RabbitmqReceiver
  def self.start
    connection = Bunny.new
    connection.start

    channel = connection.create_channel
    queue = channel.queue('transactions')

    queue.subscribe(block: true) do |_delivery_info_, _properties, body|
      transaction_id = body.to_i
      TransactionWorker.perform_async(transaction_id)
    end

    puts "Finish"
  end
end