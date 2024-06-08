class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
  end

  def create
    @transaction = Transaction.new

    ActiveRecord::Base.transaction do
      if @transaction.save
        RabbitmqSender.send_transaction(@transaction.id)
      end
    end
  end

  def new
    @transaction = Transaction.new
  end

  def private
    params.require(:transaction).permit(:amount, :map_id)
  end
end