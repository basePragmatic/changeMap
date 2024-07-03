namespace :rabbitmq do
  desc "Start RabbitMQ"
  task receive: :environment do
    RabbitmqReceiver.start
  end
end
