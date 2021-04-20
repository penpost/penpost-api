require 'rails_helper'

RSpec.describe Mutations::SignInUser do

  let(:migration) { Mutations::SignInUser.new(object: nil, field: nil, context: { session: {} }) }

  def create_user
    User.create!(
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
  end

  it 'logs in a user' do
    user = create_user

    result = migration.resolve(
      credentials: {
        email: user.email,
        password: user.password
      }
    )

    # assert result[:token].present?
    assert_equal result[:user], user
  end

  it 'failure because no credentials' do
    result = migration.resolve()

    assert_nil result
  end

  it 'failure because wrong email' do
    user = create_user

    result = migration.resolve(
      credentials: {
        email: 'wrong',
        password: user.password
      }
    )
    assert_nil result
  end

  it 'failure because wrong password' do
    user = create_user

    result = migration.resolve(
      credentials: {
        email: user.password,
        password: 'wrong'
      }
    )
    assert_nil result
  end
end