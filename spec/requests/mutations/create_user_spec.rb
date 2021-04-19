require 'rails_helper'

RSpec.describe Mutations::CreateUser do

  let(:migration) { Mutations::CreateUser.new(object: nil, field: nil, context: {}) }

  describe 'CreateUser creates a User' do
    it 'CREATES A USER' do
          
      #     user = perform(
      #       name: 'Test User',
      #       street: 'mulberry lane',
      #       description: 'mememe',
      #       city: 'denver',
      #       state: 'co',
      #       zip: '80218',
      #       country: 'united states' ,    
      #       auth_provider: {
      #         credentials: {
      #           email: 'email@example.com',
      #           password: '[omitted]'
      #         }
      #       }
      #     )

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
    # assert_equal user.name, 'Test User'
    # assert_equal user.email, 'email@example.com'

    expect(result[:name]).to eq('Test User')
    expect(result[:errors]).to be_nil
    end
  end
end

# RSpec.describe "Graphql create user mutation" do 
#   it 'can create a user' do
#     def perform(args = {})
#       require 'pry'; binding.pry
#       Mutations::CreateUser.new(object: nil, field: nil, context: {}).resolve(args)
#     end
  
#     user = perform(
#       name: 'Test User',
#       street: 'mulberry lane',
#       description: 'mememe',
#       city: 'denver',
#       state: 'co',
#       zip: '80218',
#       country: 'united states' ,    
#       auth_provider: {
#         credentials: {
#           email: 'email@example.com',
#           password: '[omitted]'
#         }
#       }
#     )

#     assert user.persisted?
#     assert_equal user.name, 'Test User'
#     assert_equal user.email, 'email@example.com'
#   end
# end