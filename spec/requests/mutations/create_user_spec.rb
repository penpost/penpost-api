require 'rails_helper'

RSpec.describe "Graphql create user mutation" do 

  it 'can create new user' do
    def perform(args = {})
      Mutations::CreateUser.new(object: nil, field: nil, context: {}).resolve(args)
    end
  
    user = perform(
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

    assert user.persisted?
    assert_equal user.name, 'Test User'
    assert_equal user.email, 'email@example.com'
  end
end
