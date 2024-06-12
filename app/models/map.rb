class Map < ApplicationRecord
  belongs_to :user
  has_many :transactions

  # scope :by_name, -> (query) { where("name LIKE ?", "%#{query}%") }
  scope :map_names, -> { pluck(:id, :from_exchange_item, :where_exchange_item).map { |id, from, where| ["From: #{from} To: #{where}", id] } }
end
