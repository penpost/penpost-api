require 'rails_helper'

RSpec.describe('Dashboard') do
  describe 'as an authenticated user' do
    before :each do
      @charlie = User.create!(name: 'Charlie Frost', email: 'chuck@example.com', password: 'pw1234', street: 'mulberry lane', city: 'denver', state: 'co', zip: '80218', country: 'united states', address_verified: 1)
      @mary = User.create!(name: 'Mary Berry', email: 'mary@example.com', password: 'pw1234', street: 'mary drive', city: 'santa fe', state: 'nm', zip: '55555', country: 'united states', address_verified: 1)
      @joe = User.create!(name: 'Joe Cluck', email: 'joe@example.com', password: 'pw1234', street: 'mary drive', city: 'santa fe', state: 'nm', zip: '55555', country: 'united states', address_verified: 1)
      @moe = User.create!(name: 'Muhammed Pas', email: 'moe@example.com', password: 'pw1234', street: 'roxbury road', city: 'new york city', state: 'ny', zip: '55552', country: 'united states')
    end

    it "should friend a user" do
      expect(@charlie.friends.include?(@mary)).to equal(false)
      @charlie.friend_request(@mary)
      assert @charlie.friends.include?(@mary)
      assert @mary.inverse_friends.include?(@charlie)
      assert @mary.pals?(@charlie)
      assert @charlie.pals?(@mary)
    end

    it "should find current pal" do
      connection_1 = Friendship.create!(sender: @charlie, receiver: @mary, current: false)
      connection_2 = Friendship.create!(sender: @mary, receiver: @joe, current: true)
      connection_3 = Friendship.create!(sender: @moe, receiver: @charlie, current: true)

      expect(@charlie.current_pal).to eq(@moe)
      expect(@charlie.current_pal).to_not eq(@mary)
      expect(@mary.current_pal).to_not eq(@charlie)
      expect(@mary.current_pal).to eq(@joe)
    end
  end
end
