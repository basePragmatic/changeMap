require_relative '../../db/setup'
DB = Sequel.sqlite("db/development.sqlite3")

class BestChange < Sequel::Model(DB[:bestchanges])
end
