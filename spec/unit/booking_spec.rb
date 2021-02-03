require './lib/booking.rb'

describe Booking do

  describe ".create" do
    it "creates a new booking" do

      property = Property.create(name: "small bunker", description: "a tiny bunker", price: 1.00)
      user = User.create(username: "test_user", password: "password", email: "test@email.com")

      booking = Booking.create(property_id: property.id, user_id: user.id, status: "requested")

      expect(booking.property_id).to eq(property.id)
      expect(booking.user_id).to eq(user.id)
      expect(booking.status).to eq("requested")

    end

  end

end
