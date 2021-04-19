require 'rails_helper'

RSpec.describe Mutations::UpdateUser do

  let(:migration) { Mutations::UpdateUser.new(object: nil, field: nil, context: {}) }

  it 'updates a user' do
    user = User.create!(
      name: 'Test User',
      street: 'mulberry lane',
      description: 'mememe',
      city: 'denver',
      state: 'co',
      zip: '80218',
      country: 'united states' ,    
      email: 'email@example.com',
      password: '[omitted]'
    )

    assert_equal User.last.description, 'mememe'
    
    result = migration.resolve(
      id: user.id,
      description: 'new description'
    )

  assert_equal User.last.description, 'new description'
  assert_equal User.last.email, 'email@example.com'

  expect(result[:name]).to eq('Test User')
  expect(result[:errors]).to be_nil
  end
end
