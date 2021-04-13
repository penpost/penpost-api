require 'rails_helper'

RSpec.describe('Dashboard') do
  describe 'as an authenticated user' do
    before :each do
      @charlie = User.create!(name: 'Charlie Frost', email: 'chuck@example.com', password: 'pw1234', street: 'mulberry lane', city: 'denver', state: 'co', zip: '80218', country: 'united states', address_verified: 1)
      @mary = User.create!(name: 'Mary Berry', email: 'mary@example.com', password: 'pw1234', street: 'mary drive', city: 'santa fe', state: 'nm', zip: '55555', country: 'united states', address_verified: 1)
    end

    it "should friend a user" do
      expect(@charlie.friends.include?(@mary)).to equal(false)
      @charlie.friend_request(@mary)
      assert @charlie.friends.include?(@mary)
      assert @mary.inverse_friends.include?(@charlie)
      assert @mary.pals.include?(@charlie)
      assert @charlie.pals?(@mary)
    end
  end
end
