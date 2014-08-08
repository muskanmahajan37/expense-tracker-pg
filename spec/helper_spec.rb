require 'rspec'
require 'pg'
require 'expense'
require 'category'
require 'company'
require 'time'

DB = PG.connect({:dbname => 'make_it_rain_test'})

RSpec.configure do |config|
  config.before(:each) do
    DB.exec("DELETE FROM expenses *;")
  end
end
