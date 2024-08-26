class Transaction < ApplicationRecord
  belongs_to :map

  delegated_type :transactable, types: %w[Stock Exchange Exchanger]
  accepts_nested_attributes_for :transactable
end
