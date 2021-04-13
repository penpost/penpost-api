require 'rails_helper'

RSpec.describe Friendship, type: :model do
  describe 'relationships' do
    it {should belong_to :sender}
    it {should belong_to :receiver}
  end

  describe 'validations' do
    it {should validate_presence_of :sender_id}
    it {should validate_presence_of :receiver_id}
  end
  
end
