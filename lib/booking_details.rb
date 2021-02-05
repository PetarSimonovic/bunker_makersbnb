require 'pg'
require './lib/property'

class BookingDetails

  attr_reader :property_id, :host_id, :name, :status, :guest_id, :booking_id

  def initialize(property_id:, host_id:, name:, status:, guest_id:, booking_id:)
    @property_id = property_id
    @host_id = host_id
    @name = name
    @status = status
    @guest_id = guest_id
    @booking_id = booking_id
  end

  def self.booking_details(user_id:)
    if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'bunker_test')
      else
        connection = PG.connect(dbname: 'bunker')
    end

    details = connection.exec("SELECT properties.property_id, properties.host_id, name, status, guest_id, booking_id FROM properties INNER JOIN bookings ON bookings.property_id = properties.property_id WHERE properties.host_id = '#{user_id.to_i}' AND status = 'requested';")

    details.map do |detail|
      BookingDetails.new(property_id: detail['property_id'], name: detail['name'], status: detail['status'],  host_id: detail['host_id'], guest_id: detail['guest_id'], booking_id: detail['booking_id'])
    end
  end


  def self.guest_bookings(user_id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bunker_test')
    else
      connection = PG.connect(dbname: 'bunker')
      end

      details = connection.exec("SELECT properties.property_id, properties.host_id, name, status, guest_id, booking_id FROM properties INNER JOIN bookings ON bookings.property_id = properties.property_id WHERE guest_id = '#{user_id}' AND status = 'approved';")
      
      details.map do |detail|
        BookingDetails.new(property_id: detail['property_id'], name: detail['name'], status: detail['status'],  host_id: detail['host_id'], guest_id: detail['guest_id'], booking_id: detail['booking_id'])
      end

  end

end