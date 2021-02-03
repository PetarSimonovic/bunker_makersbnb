require 'pg'
require_relative './database_setup'
require_relative './user'

class Property

    def self.create(user_id:, name:, description:, price:)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'bunker_test')
          else
            connection = PG.connect(dbname: 'bunker')
          end
        result = connection.exec("INSERT INTO properties (host, name, description, price) VALUES ('#{user_id}', '#{name}', '#{description}', '#{price}') RETURNING host, id, name, description, price;")
        Property.new(id: result[0]['id'], name: result[0]['name'], description: result[0]['description'], price: result[0]['price'], user_id: result[0]['host'])
    end

    def self.all
      if ENV['ENVIRONMENT'] == 'test'
          connection = PG.connect(dbname: 'bunker_test')
        else
          connection = PG.connect(dbname: 'bunker')
      end

      properties = connection.exec("SELECT * FROM properties;")

      properties.map do |property|
        Property.new(id: property['id'], name: property['name'], description: property['description'], price: property['price'], user_id: property['host'])
      end

    end

    attr_reader :id, :name, :description, :price, :user_id

    def initialize(id:, name:, description:, price:, user_id:)
        @id = id
        @name = name
        @description = description
        @price = price
        @user_id = user_id
    end
end
