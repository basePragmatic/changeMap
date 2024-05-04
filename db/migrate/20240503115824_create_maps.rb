class CreateMaps < ActiveRecord::Migration[7.1]
  def change
    create_table :maps do |t|
      t.string :source_exchange
      t.string :destination_exchange_currency
      t.float :source_exchange_currency_amount
      t.float :destination_exchange_currency_amount
      t.float :lost_amount

      t.timestamps
    end
  end
end
