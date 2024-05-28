class RabbitmqReceiver
  def self.start
    Thread.new do
      begin
        connection = Bunny.new(hostname: 'localhost')
        connection.start

        puts "Connected to RabbitMQ"

        channel = connection.create_channel
        queue = channel.queue('transactions')

        puts "Subscribed to queue: transactions"
        puts "Waiting for messages..."

        queue.subscribe(block: true) do |_delivery_info, _properties, body|
          transaction_id = body.to_i
          puts "Received transaction ID: #{transaction_id}"
          TransactionWorker.perform_async(transaction_id)
        end
      rescue Interrupt => _
        connection.close
        puts "RabbitMQ connection closed."
      rescue => e
        puts "An error occurred: #{e.message}"
        puts e.backtrace.join("\n")
      end
    end
  end
end