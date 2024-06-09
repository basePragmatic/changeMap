class Map < ApplicationRecord
  belongs_to :user
  has_many :transactions

  # scope :by_name, -> (query) { where("name LIKE ?", "%#{query}%") }
  scope :map_names, -> { self.map { |map| ["From: #{map.from_exchange_item} To: #{map.where_exchange_item}"]} }
end
