# frozen_string_literal: true

class TransactionPairComponent < ViewComponent::Base
  def initialize(map)
    @map = map
  end

  def pair
    "From: #{@map.from_exchange_item} | Where: #{@map.where_exchange_item}"
  end
end
