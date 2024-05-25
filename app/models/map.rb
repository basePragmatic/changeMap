class Map < ApplicationRecord
  has_many :transactions
  # scope :by_name, -> (query) { where("name LIKE ?", "%#{query}%") }
end
