require 'sequel'

DB = Sequel.sqlite('db/development.sqlite3')

Dir[File.join(Rails.root, 'app', 'models', '*.rb')].each { |file| require file }