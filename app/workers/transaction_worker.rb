require 'sidekiq'
require 'bunny'

class TransactionWorker
  include Sidekiq::Worker

  def perform(transaction_id)
    begin
      transaction = Transaction.find(transaction_id)
      puts "Processed transaction ##{transaction_id}"
    rescue ActiveRecord::RecordNotFound
      puts "Transaction with ID ##{transaction_id} not found"
    end
  end
end