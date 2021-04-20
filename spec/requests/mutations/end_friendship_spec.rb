require 'rails_helper'

RSpec.describe "end friendship" do 
it "receiver and requested can end a friendship" do 
  celine = User.create!(name: 'Celine Dion', email: 'titanic@example.com', password: 'pw1234', street: 'titanic ave', city: 'new york city', state: 'ny', zip: '55523', country: 'united states', address_verified: 1)
  korra = User.create!(name: 'Korra Avatar', email: 'korra@example.com', password: 'pw1234', street: 'water bender st', city: 'republic city', state: 'ny', zip: '55123', country: 'united states', address_verified: 1)
  connection1 = Friendship.create!(sender: celine, receiver: korra, current: true)


  query_params =  "mutation {
                            endFriendship( input: {id: #{korra.id} } )
                                {
                              current
                                }
                            }"

  post graphql_path, params: { query: query_params }  

  result = JSON.parse(response.body, symbolize_names: true )

  expect(response).to be_successful  
  expect(response.status).to eq(200)
  expect(response.content_type).to eq("application/json; charset=utf-8")

  expect(result).to have_key(:data)                          
  expect(result[:data]).to be_a(Hash)                          
  expect(result[:data]).to have_key(:endFriendship)                          
  expect(result[:data][:endFriendship]).to be_a(Hash) 
  expect(result[:data][:endFriendship]).to have_key(:current) 
  expect(result[:data][:endFriendship][:current]).to be(true).or be(false) 

  expect(result[:data][:endFriendship][:current]).to eq(false)
  end 
end 