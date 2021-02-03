require 'pg'

def setup_test_database
  p "Setting up database..."

  connection = PG.connect(dbname: "bunker_test")

  connection.exec("TRUNCATE properties;")
  connection.exec("TRUNCATE users;")
end
