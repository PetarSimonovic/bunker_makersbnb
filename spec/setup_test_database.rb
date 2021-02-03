require 'pg'

def setup_test_database
  p "Setting up database..."

  connection = PG.connect(dbname: "bunker_test")

  connection.exec("TRUNCATE properties, users, bookings;")
  # connection.exec("TRUNCATE users, bookings;")
end
