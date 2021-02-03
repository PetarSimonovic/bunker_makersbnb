require 'pg'
require_relative './database_setup'

class Booking

  attr_reader :booking_id, :property_id, :guest_id, :status

  def initialize(booking_id:, property_id:, guest_id:, status:)

    @booking_id = booking_id
    @property_id = property_id
    @guest_id = guest_id
    @status = status

  end

  def self.create(property_id:, guest_id:, status: "requested")

    if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'bunker_test')
      else
        connection = PG.connect(dbname: 'bunker')
    end

    result = connection.exec("INSERT INTO bookings (property_id, guest_id, status) VALUES ('#{property_id}', '#{guest_id}', '#{status}') RETURNING booking_id, property_id, guest_id, status;")
    Booking.new(booking_id: result[0]['id'], property_id: result[0]['property_id'], guest_id: result[0]['guest_id'], status: result[0]['status'])

  end

end
