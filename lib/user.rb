class User

 attr_reader :username, :password, :email

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

end
