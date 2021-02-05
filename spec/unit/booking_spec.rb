require './lib/booking.rb'
require './lib/booking_details.rb'

describe Booking do

  describe ".create" do
    it "creates a new booking" do

      user = User.create(username: "test_user", password: "password", email: "test@email.com")
      property = Property.create(host_id: user.user_id, name: "small bunker", description: "a tiny bunker", price: 1.00)

      booking = Booking.create(property_id: property.property_id, host_id: property.host_id, guest_id: user.user_id, status: "requested")

      expect(booking.property_id).to eq(property.property_id)
      expect(booking.guest_id).to eq(user.user_id)
      expect(booking.status).to eq("requested")

    end

    describe '.booking_details' do
      it 'should check users details against the user table' do

        host = User.create(username: "test_host", password: "password", email: "test@email.com")
        guest = User.create(username: "test_guest", password: "password", email: "test@email.com")

        property = Property.create(host_id: host.user_id, name: "small bunker", description: "a tiny bunker", price: 1.00)

        Booking.create(property_id: property.property_id, host_id: property.host_id, guest_id: guest.user_id, status: "requested")

        result = BookingDetails.booking_details(user_id: host.user_id)

        expect(result.first.host_id).to eq host.user_id

      end
    end

    describe '.update_details' do
      it 'should allow host to approve booking and update booking table' do

        host = User.create(username: "test_host", password: "password", email: "test@email.com")
        guest = User.create(username: "test_guest", password: "password", email: "test@email.com")

        property = Property.create(host_id: host.user_id, name: "small bunker", description: "a tiny bunker", price: 1.00)

        Booking.create(property_id: property.property_id, host_id: property.host_id, guest_id: guest.user_id, status: "requested")

        result = BookingDetails.booking_details(user_id: host.user_id)

        Booking.update(booking_id: result[0].booking_id)

        updated_result = BookingDetails.booking_details(user_id: host.user_id)
  
        expect(updated_result.first.status).to eq "approved"

      end
    end


  end

end
