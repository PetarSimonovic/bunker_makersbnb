require 'pg'
require_relative './database_setup'

class Booking

  attr_reader :id, :property_id, :user_id, :status

  def initialize(id:, property_id:, user_id:, status:)

    @id = id
    @property_id = property_id
    @user_id = user_id
    @status = status

  end

  def self.create(property_id:, user_id:, status: "requested")

    if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'bunker_test')
      else
        connection = PG.connect(dbname: 'bunker')
    end

    result = connection.exec("INSERT INTO bookings (property_id, user_id, status) VALUES ('#{property_id}', '#{user_id}', '#{status}') RETURNING id, property_id, user_id, status;")
    Booking.new(id: result[0]['id'], property_id: result[0]['property_id'], user_id: result[0]['user_id'], status: result[0]['status'])

  end

end
