require 'pg'
require_relative './database_setup'
require_relative './user'
require_relative './booking'

class Property

    def self.create(host_id:, name:, description:, price:)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'bunker_test')
          else
            connection = PG.connect(dbname: 'bunker')
          end
        result = connection.exec("INSERT INTO properties (host_id, name, description, price) VALUES ('#{host_id}', '#{name}', '#{description}', '#{price}') RETURNING host_id, property_id, name, description, price;")
        Property.new(property_id: result[0]['property_id'], name: result[0]['name'], description: result[0]['description'], price: result[0]['price'], host_id: result[0]['host_id'])
    end

    def self.all
      if ENV['ENVIRONMENT'] == 'test'
          connection = PG.connect(dbname: 'bunker_test')
        else
          connection = PG.connect(dbname: 'bunker')
      end

      properties = connection.exec("SELECT * FROM properties;")

      properties.map do |property|
        Property.new(property_id: property['property_id'], name: property['name'], description: property['description'], price: property['price'], host_id: property['host_id'])
      end

    end

    attr_reader :property_id, :name, :description, :price, :host_id

    def initialize(property_id:, name:, description:, price:, host_id:)
        @property_id = property_id
        @name = name
        @description = description
        @price = price
        @host_id = host_id
    end
end
