require 'rails_helper'

RSpec.describe "Graphql create updateUser mutation" do 

#   it 'can update existing user' do
#     user = User.create!(
#       name: 'Test User',
#       street: 'mulberry lane',
#       description: 'mememe',
#       city: 'denver',
#       state: 'co',
#       zip: '80218',
#       country: 'united states',    
#       email: 'email@example.com',
#       password: 'pw123'
#     )

#     assert_equal user.description, 'mememe'    
  
#     post graphql_path, params: { mutation: mutation(id: user.id) }

#     assert user.persisted?
#     assert_equal user.description, 'old rust about me!'
#   end

#   def mutation(id:)
#     <<~GQL
#     mutation {
#       updateUser(input: {
#         id: #{id}
#         description: 'old rust about me!'
#         })
#         {
#           name
#           email
#           description
#           street 
#           city 
#           state 
#           zip 
#           country
#           addressVerified
#         }
#       }
#       GQL
#   end
end
        
        # def update(args)
    #   require 'pry'; binding.pry
    #   Mutations::UpdateUser.new(object: nil, field: nil, context: {}).resolve(args)
    # end

    # # def perform(args)
    # #   require 'pry'; binding.pry
    # #   Mutations::UpdateUser.new(object: user, field: nil, context: {}).resolve(args)
    # # end

    # update(
    #   id: user.id,
    #   description: 'new shiny description'
    # )

    # assert user.persisted?
    # assert_equal user.name, 'Test User'
    # assert_equal user.email, 'email@example.com'
    # assert_equal user.description, 'new shiny description'




    # result = JSON.parse(response.body, symbolize_names: true)

    # expect(response).to be_successful 
    # expect(response.status).to eq(200)
    # expect(response.content_type).to eq("application/json; charset=utf-8")


    # expect(result).to have_key(:data)                          
    # expect(result[:data]).to be_a(Hash)                          
    # expect(result[:data]).to have_key(:user)                          
    # expect(result[:data][:user]).to be_a(Hash) 

    # expect(result[:data][:user]).to have_key(:name)                          
    # expect(result[:data][:user][:name]).to be_a(String)                          
    # expect(result[:data][:user]).to have_key(:email)                          
    # expect(result[:data][:user][:email]).to be_a(String)                          
    # expect(result[:data][:user]).to have_key(:description)                          
          
    # expect(result[:data][:user]).to have_key(:street)                          
    # expect(result[:data][:user][:street]).to be_a(String)                          
    # expect(result[:data][:user]).to have_key(:city)                          
    # expect(result[:data][:user][:city]).to be_a(String)                          
    # expect(result[:data][:user]).to have_key(:state)                          
    # expect(result[:data][:user][:state]).to be_a(String)                          
    # expect(result[:data][:user]).to have_key(:zip)                          
    # expect(result[:data][:user][:zip]).to be_a(String)                          
    # expect(result[:data][:user]).to have_key(:country)                          
    # expect(result[:data][:user][:country]).to be_a(String)                          
    # expect(result[:data][:user]).to have_key(:addressVerified)                          
    # expect(result[:data][:user][:addressVerified]).to be(true).or be(false)                        

    # pal_info = result[:data][:user][:activePal]
    # expect(pal_info).to be_a(Hash)
    # expect(pal_info).to have_key(:name)
    # expect(pal_info).to have_key(:description)