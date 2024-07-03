require "sequel"

DB = Sequel.sqlite("db/development.sqlite3")

DB.create_table? :bestchanges do
  primary_key :id
  String :from_name, unique: true, null: false
  String :to_name, unique: true, null: false
  Float :price, null: false
end

class BestChange < Sequel::Model(DB[:bestchanges])
end
