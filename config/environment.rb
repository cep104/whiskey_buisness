require 'bundler/setup'
Bundler.require



ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/gifts.sqlite"
)
require_all 'app'