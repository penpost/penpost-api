require 'rails_helper'

RSpec.describe Mutations::SignInUser do

  let(:signin) { Mutations::SignInUser.new(object: nil, field: nil, context: { session: {} }) }
  let(:migration) { Mutations::UpdateUser.new(object: nil, field: nil, context: { session: {} }) }

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

    result = signin.resolve(
      credentials: {
        email: user.email,
        password: user.password
      }
    )

    result_2 = migration.resolve(
      id: user.id,
      description: "here is a new description"
    )

  end


end