module Transactable
  extend ActiveSupport::Concern

  included do
    has_many :transactions, as: :transactable
  end
end