require 'rails_helper'

RSpec.describe Mutations::CreateUser do

  let(:migration) { Mutations::CreateUser.new(object: nil, field: nil, context: {}) }

  describe 'CreateUser creates a User' do
    it 'creates a user' do
      result = migration.resolve(
          name: 'Test User',
          street: 'mulberry lane',
          description: 'mememe',
          city: 'denver',
          state: 'co',
          zip: '80218',
          country: 'united states' ,    
          auth_provider: {
            credentials: {
              email: 'email@example.com',
              password: '[omitted]'
            }
          }
        )
    assert_equal User.last.name, 'Test User'
    assert_equal User.last.email, 'email@example.com'

    expect(result[:name]).to eq('Test User')
    expect(result[:errors]).to be_nil
    end
  end
end

