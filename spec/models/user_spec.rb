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
  end
end
