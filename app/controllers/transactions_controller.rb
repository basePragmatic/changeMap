class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
  end

  def create
    @transaction = Transaction.new(transaction_params)

    ActiveRecord::Base.transaction do
      if @transaction.save
        RabbitmqSender.send_transaction(@transaction.id)
        redirect_to root_path
      end
    end
  end

  def new
    @transaction = Transaction.new
  end

  def transaction_params
    params.require(:transaction).permit(:amount, :map_id, :date)
  end
end