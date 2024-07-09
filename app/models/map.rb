class Map < ApplicationRecord
  belongs_to :user, optional: true
  has_many :transactions

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  # scope :by_name, -> (query) { where("name LIKE ?", "%#{query}%") }
  scope :map_names, -> { pluck(:id, :from_exchange_item, :where_exchange_item).map { |id, from, where| ["From: #{from} To: #{where}", id] } }

  settings index: {number_of_shards: 1} do
    mappings dynamic: "false" do
      indexes :from_exchange_item, type: "text", analyzer: "english"
      indexes :where_exchange_item, type: "text", analyzer: "english"
    end
  end

  def as_indexed_json(options = {})
    as_json(only: [:from_exchange_item, :where_exchange_item])
  end
end
