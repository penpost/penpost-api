require 'rails_helper'

RSpec.describe "Graphql create random friendship" do 
it "can create a random pen pal relationship" do 
  celine = User.create!(name: 'Celine Dion', email: 'titanic@example.com', password: 'pw1234', street: 'titanic ave', city: 'new york city', state: 'ny', zip: '55523', country: 'united states', address_verified: 1)
  korra = User.create!(name: 'Korra Avatar', email: 'korra@example.com', password: 'pw1234', street: 'water bender st', city: 'republic city', state: 'ny', zip: '55123', country: 'united states', address_verified: 1)

  query_params =  "mutation {
                    randomPal( input: {id: #{celine.id} } )
                        {
                        name
                        email
                        street
                        city
                        state
                        zip
                        country
                        }
                    }"

  post graphql_path, params: { query: query_params }  

  result = JSON.parse(response.body, symbolize_names: true )

  expect(response).to be_successful  
  expect(response.status).to eq(200)
  expect(response.content_type).to eq("application/json; charset=utf-8")

  expect(result).to have_key(:data)                          
  expect(result[:data]).to be_a(Hash)                          
  expect(result[:data]).to have_key(:randomPal)                          
  expect(result[:data][:randomPal]).to be_a(Hash) 

  expect(result[:data][:randomPal]).to have_key(:name)
  expect(result[:data][:randomPal][:name]).to be_a(String)
  expect(result[:data][:randomPal][:name]).to eq(korra.name)

  expect(result[:data][:randomPal]).to have_key(:email)
  expect(result[:data][:randomPal][:email]).to be_a(String)
  expect(result[:data][:randomPal][:email]).to eq(korra.email)

  expect(result[:data][:randomPal]).to have_key(:street)
  expect(result[:data][:randomPal][:street]).to be_a(String)
  expect(result[:data][:randomPal][:street]).to eq(korra.street)

  expect(result[:data][:randomPal]).to have_key(:city)
  expect(result[:data][:randomPal][:city]).to be_a(String)
  expect(result[:data][:randomPal][:city]).to eq(korra.city)

  expect(result[:data][:randomPal]).to have_key(:state)
  expect(result[:data][:randomPal][:state]).to be_a(String)
  expect(result[:data][:randomPal][:state]).to eq(korra.state)

  expect(result[:data][:randomPal]).to have_key(:zip)
  expect(result[:data][:randomPal][:zip]).to be_a(String)
  expect(result[:data][:randomPal][:zip]).to eq(korra.zip)

  expect(result[:data][:randomPal]).to have_key(:country)
  expect(result[:data][:randomPal][:country]).to be_a(String)
  expect(result[:data][:randomPal][:country]).to eq(korra.country)

  expect(korra.friendships_received.first.current).to eq(true)

end 
it "will return error message if all users have penpals already" do
  celine = User.create!(name: 'Celine Dion', email: 'titanic@example.com', password: 'pw1234', street: 'titanic ave', city: 'new york city', state: 'ny', zip: '55523', country: 'united states', address_verified: 1)
  korra = User.create!(name: 'Korra Avatar', email: 'korra@example.com', password: 'pw1234', street: 'water bender st', city: 'republic city', state: 'ny', zip: '55123', country: 'united states', address_verified: 1)
  connection1 = Friendship.create!(sender: celine, receiver: korra, current: true)


  query_params =  "mutation {
                    randomPal( input: {id: #{celine.id} } )
                        {
                        name
                        email
                        street
                        city
                        state
                        zip
                        country
                        }
                    }"

  post graphql_path, params: { query: query_params }  

  result = JSON.parse(response.body, symbolize_names: true )

  expect(response).to be_successful 
  expect(response.status).to eq(200)
  expect(response.content_type).to eq("application/json; charset=utf-8")

  expect(result).to have_key(:data)                          
  expect(result[:data]).to be_a(Hash)                                                   
  expect(result[:data]).to have_key(:randomPal)                         
  expect(result[:errors]).to be_an(Array) 
  expect(result[:errors][0]).to have_key(:message)                          
  expect(result[:errors][0][:message]).to be_a(String) 
  expect(result[:errors][0][:message]).to eq("All users have current friends") 
  end 
end 