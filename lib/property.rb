require 'pg'
require_relative './database_setup'

class Property


    def self.create(name:, description:, price:)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'bunker_test')
          else
            connection = PG.connect(dbname: 'bunker')
          end
        result = connection.exec("INSERT INTO properties (name, description, price) VALUES ('#{name}', '#{description}', '#{price}') RETURNING id, name, description, price;")
        Property.new(id: result[0]['id'], name: result[0]['name'], description: result[0]['description'], price: result[0]['price'])
    end

    def self.all

      if ENV['ENVIRONMENT'] == 'test'
          connection = PG.connect(dbname: 'bunker_test')
        else
          connection = PG.connect(dbname: 'bunker')
      end

      properties = connection.exec("SELECT * FROM properties;")

      properties.map do |property|
        Property.new(id: property['id'], name: property['name'], description: property['description'], price: property['price'] )
      end

    end

    attr_reader :id, :name, :description, :price

    def initialize(id:, name:, description:, price:)
        @id = id
        @name = name
        @description = description
        @price = price
    end
end
