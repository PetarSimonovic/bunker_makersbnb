require './lib/property.rb'

describe Property do

    describe '.create' do 
        it 'should create a property listing' do 
        
        property = Property.create(name: 'nuclear bunker', description: 'Designed for up to 600 military and civilian personnel, possibly even the Prime Minister', price: 10.00)

        expect(property.name).to eq 'nuclear bunker'
        expect(property.description).to eq 'Designed for up to 600 military and civilian personnel, possibly even the Prime Minister'
        expect(property.price).to eq "10.00"
        end
    end 
end