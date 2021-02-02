require 'user'

describe User do
  describe '.create' do
    it 'should add a users details to our database table' do

      user = User.create(username: "adam123", password: "Makers123", email: "adam@makers.com")

      expect(user.username).to eq "adam123"
      expect(user.password).to eq "Makers123"
      expect(user.email).to eq "adam@makers.com"
    end
  end

  describe '.find' do
    it 'should check users details against the user table' do
      
     user = User.create(username: "adam123", password: "Makers123", email: "adam@makers.com")

     result = User.find(id: user.id)

      expect(result.id).to eq user.id
      expect(result.username).to eq "adam123"

    end
  end



end
