class TransactionWorker
  include Sidekiq::Worker

  def perform(transaction_id)
    transaction = Transaction.find(1)
  end
end