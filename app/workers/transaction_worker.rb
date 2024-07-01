require "sidekiq"
require "bunny"

class TransactionWorker
  include Sidekiq::Worker

  def perform(transaction_id)
    transaction = Transaction.find(transaction_id)
    puts "Processed transaction ##{transaction}"
  rescue ActiveRecord::RecordNotFound
    puts "Transaction with ID ##{transaction} not found"
  end
end
