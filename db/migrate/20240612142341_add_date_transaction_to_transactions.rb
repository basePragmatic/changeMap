class AddDateTransactionToTransactions < ActiveRecord::Migration[7.1]
  def change
    add_column :transactions, :date, :datetime
  end
end
