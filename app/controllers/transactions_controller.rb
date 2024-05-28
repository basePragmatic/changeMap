class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
  end

  def create
    @transaction = Transaction.new
    if @transaction.save
      RabbitmqSender.send_transaction(@transaction.id)
    end
  end

  def private
    params.require(:transaction).permit(:amount, :map_id)
  end
end