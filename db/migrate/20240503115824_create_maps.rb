class CreateMaps < ActiveRecord::Migration[7.1]
  def change
    create_table :maps do |t|
      t.string :from_exchange_item
      t.string :where_exchange_item

      t.timestamps
    end
  end
end
