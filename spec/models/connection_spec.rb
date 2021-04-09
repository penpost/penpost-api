require 'rails_helper'

RSpec.describe Connection, type: :model do
  describe 'reationships' do
    it {should belong_to :user_1}
    it {should belong_to :user_2}
  end

  describe 'validations' do
    it {should validate_presence_of :current}
    it {should validate_presence_of :user_1}
    it {should validate_presence_of :user_2}
  end
  
end
