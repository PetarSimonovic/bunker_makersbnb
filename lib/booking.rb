require 'pg'
require_relative './database_setup'

class Booking

  attr_reader :booking_id, :property_id, :host_id, :guest_id, :status

  def initialize(booking_id:, property_id:, host_id:, guest_id:, status:)

    @booking_id = booking_id
    @property_id = property_id
    @host_id = host_id
    @guest_id = guest_id
    @status = status

  end

  def self.create(property_id:, guest_id:, status: "requested", host_id:)

    if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'bunker_test')
      else
        connection = PG.connect(dbname: 'bunker')
    end

    result = connection.exec("INSERT INTO bookings (property_id, guest_id, status, host_id) VALUES ('#{property_id}', '#{guest_id.to_i}', '#{status}', '#{host_id.to_i}') RETURNING booking_id, property_id, guest_id, status, host_id;")
    Booking.new(booking_id: result[0]['booking_id'], property_id: result[0]['property_id'], guest_id: result[0]['guest_id'], status: result[0]['status'], host_id: result[0]['host_id'])

  end

  def self.update(booking_id:)

    if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'bunker_test')
      else
        connection = PG.connect(dbname: 'bunker')
    end

    result = connection.exec("UPDATE bookings SET status = 'approved' WHERE booking_id = '#{booking_id}';")

  end

end
