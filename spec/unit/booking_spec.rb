require './lib/booking.rb'

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

  end

end
