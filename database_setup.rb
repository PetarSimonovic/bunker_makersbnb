require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup(dbname: 'bunker_test')
else
  DatabaseConnection.setup(dbname: 'bunker')
end
