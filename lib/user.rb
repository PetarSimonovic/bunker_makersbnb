require 'pg'

class User

 attr_reader :id, :username, :password, :email

 def initialize(id:, username:, password:, email:)
   @id = id
   @username = username
   @password = password
   @email = email
 end

 def self.create(username:, password:, email:)
   if ENV['ENVIRONMENT'] == 'test'
       connection = PG.connect(dbname: 'bunker_test')
     else
       connection = PG.connect(dbname: 'bunker')
     end
     result = connection.exec("INSERT INTO users (username, password, email) VALUES ('#{username}', '#{password}', '#{email}') RETURNING id, username, password, email;")
     User.new(id: result[0]['id'], username: result[0]['username'], password: result[0]['password'], email: result[0]['email'])
 end

 def self.find(id:)
  if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'bunker_test')
  else
    connection = PG.connect(dbname: 'bunker')
  end
  result = connection.exec("SELECT * FROM users WHERE id = '#{id}';")
  user = User.new(id: result[0]['id'], username: result[0]['username'], password: result[0]['password'], email: result[0]['email'])
 end

 def self.check(id:, username:, password:)
  data = self.find(id: id)
  data.id == id && data.password == password ? 'Login + login method' : 'Error: details incorrect try again'
 end

end
