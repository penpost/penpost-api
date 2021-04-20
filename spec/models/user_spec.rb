require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'reationships' do
    it {have_many :friendships_requested}
    it {have_many :friendships_received}
    it {have_many :friends}
    it {have_many :inverse_friends}
  end

  describe 'validations' do
    it {should validate_presence_of :email}
    it {should validate_uniqueness_of :email}
    it {should validate_presence_of :password}
    it {should validate_presence_of :name}
    it {should validate_presence_of :street}
    it {should validate_presence_of :city}
    it {should validate_presence_of :state}
    it {should validate_presence_of :zip}
    it {should validate_presence_of :country}
    # it {should validate_presence_of :address_verified}

    describe 'methods' do
      before :each do 
        @charlie = User.create!(name: 'Charlie Frost', email: 'chuck@example.com', password: 'pw1234', street: 'mulberry lane', city: 'denver', state: 'co', zip: '80218', country: 'united states', address_verified: 1)
        @mary = User.create!(name: 'Mary Berry', email: 'mary@example.com', password: 'pw1234', street: 'mary drive', city: 'santa fe', state: 'nm', zip: '55555', country: 'united states', address_verified: 1)
        @joe = User.create!(name: 'Joe Shmoe', email: 'joe@example.com', password: 'pw1234', street: 'trailer road', city: 'new york city', state: 'ny', zip: '55552', country: 'united states',  address_verified: 0)
        @muhammed = User.create!(name: 'Muhammed Pas', email: 'moe@example.com', password: 'pw1234', street: 'roxbury road', city: 'new york city', state: 'ny', zip: '55552', country: 'united states')
        @celine = User.create!(name: 'Celine Dion', email: 'titanic@example.com', password: 'pw1234', street: 'titanic ave', city: 'new york city', state: 'ny', zip: '55523', country: 'united states', address_verified: 1)
        @korra = User.create!(name: 'Korra Avatar', email: 'korra@example.com', password: 'pw1234', street: 'water bender st', city: 'republic city', state: 'ny', zip: '55123', country: 'united states', address_verified: 1)

        @connection1 = Friendship.create!(sender: @charlie, receiver: @mary, current: true)
        @connection2 = Friendship.create!(sender: @joe, receiver: @muhammed, current: true)
        @connection3 = Friendship.create!(sender: @mary, receiver: @joe, current: false)
      end 

      it "it can create friend_request" do 
        expect(@celine.friend_request(@korra)).to be_a(Friendship)
      end

      it "knows the relationship - pals?" do 
        expect(@charlie.pals?(@mary)).to eq(true)
        expect(@charlie.pals?(@joe)).to eq(false)
      end

      it "knows all users pals" do 
        expect(@charlie.pals).to eq([@mary])
        expect(@mary.pals).to eq([@joe, @charlie])
        expect(@korra.pals).to eq([])
      end

      it "knows the users current_pal" do 
        expect(@mary.current_pal).to eq(@charlie)
        expect(@mary.current_pal).to_not eq(@joe)
        expect(@charlie.current_pal).to eq(@mary)
      end

      it "it can find_unmatched_user" do
        expect(@korra.find_unmatched_user).to eq(@celine)
        expect(@celine.find_unmatched_user).to eq(@korra)
        expect(@celine.find_unmatched_user).to_not eq(@celine)
      end
    end
  end
end
