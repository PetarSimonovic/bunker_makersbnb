require './lib/property.rb'

describe Property do

    describe '.all' do

      it "should return a list of all properties in the table" do

      user = User.create(username: "adam123", password: "Makers123", email: "adam@makers.com")

      property = Property.create(user_id: user.id, name: "nuclear bunker", description: "basic underground chamber", price: "10.00")
      Property.create(user_id: user.id, name: "luxury bunker", description: "comes with its own pool", price: "100.00")
      Property.create(user_id: user.id, name: "abandoned bunker", description: "probably haunted", price: "15.00")

      properties = Property.all

      expect(properties.length).to eq 3
      expect(properties.first).to be_a Property
      expect(properties.first.id).to eq property.id
      expect(properties.first.name).to eq "nuclear bunker"
      expect(properties.first.description).to eq "basic underground chamber"
      expect(properties.first.user_id).to eq user.id
    end 

    end



    describe '.create' do
        it 'should create a property listing' do

        user = User.create(username: "adam123", password: "Makers123", email: "adam@makers.com")

        property = Property.create(user_id: user.id, name: 'nuclear bunker', description: 'Designed for up to 600 military and civilian personnel, possibly even the Prime Minister', price: 10.00)

        expect(property.name).to eq 'nuclear bunker'
        expect(property.description).to eq 'Designed for up to 600 military and civilian personnel, possibly even the Prime Minister'
        expect(property.price).to eq "10.00"
        expect(property.user_id).to eq user.id
        end
    end
end
