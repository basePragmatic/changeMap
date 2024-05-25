class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.integer :amount
      t.integer :commission
      t.belongs_to :map, foreign_key: true

      t.timestamps
    end
  end
end
