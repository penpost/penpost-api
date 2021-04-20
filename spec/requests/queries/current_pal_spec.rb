require 'rails_helper'

RSpec.describe "Graphql current pal query" do 
  it "returns users current pal based on id " do 
    charlie = User.create!(name: 'Charlie Frost', email: 'chuck@example.com', password: 'pw1234', street: 'mulberry lane', city: 'denver', state: 'co', zip: '80218', country: 'united states', address_verified: 1)
    mary = User.create!(name: 'Mary Berry', email: 'mary@example.com', password: 'pw1234', street: 'mary drive', city: 'santa fe', state: 'nm', zip: '55555', country: 'united states', address_verified: 1)
    connection_1 = Friendship.create!(sender: charlie, receiver: mary, current: true)
    connection_2 = Friendship.create!(sender: mary, receiver: charlie, current: true)

    query_params = "query {
                            user(id: #{charlie.id})
                            {
                                name
                                email
                                description
                                street 
                                city 
                                state 
                                zip 
                                country
                                addressVerified
                                activePal
                                {
                                    name
                                    email
                                    description
                                    street 
                                    city
                                    state
                                    zip
                                    country 
                                }
                            }         
                        }"


    post graphql_path, params: { query: query_params } 

    result = JSON.parse(response.body, symbolize_names: true)                       
    expect(response).to be_successful 
    expect(response.status).to eq(200)
    expect(response.content_type).to eq("application/json; charset=utf-8")
    expect(result).to have_key(:data)                          
    expect(result[:data]).to be_a(Hash)                          
    expect(result[:data]).to have_key(:user)                          
    expect(result[:data][:user]).to be_a(Hash) 

    expect(result[:data][:user]).to have_key(:name)                          
    expect(result[:data][:user][:name]).to be_a(String)                          
    expect(result[:data][:user]).to have_key(:email)                          
    expect(result[:data][:user][:email]).to be_a(String)                          
    expect(result[:data][:user]).to have_key(:description)                          
                            
    expect(result[:data][:user]).to have_key(:street)                          
    expect(result[:data][:user][:street]).to be_a(String)                          
    expect(result[:data][:user]).to have_key(:city)                          
    expect(result[:data][:user][:city]).to be_a(String)                          
    expect(result[:data][:user]).to have_key(:state)                          
    expect(result[:data][:user][:state]).to be_a(String)                          
    expect(result[:data][:user]).to have_key(:zip)                          
    expect(result[:data][:user][:zip]).to be_a(String)                          
    expect(result[:data][:user]).to have_key(:country)                          
    expect(result[:data][:user][:country]).to be_a(String)                          
    expect(result[:data][:user]).to have_key(:addressVerified)                          
    expect(result[:data][:user][:addressVerified]).to be(true).or be(false)                        
    
    pal_info = result[:data][:user][:activePal]
    expect(pal_info).to be_a(Hash)
    expect(pal_info).to have_key(:name)
    expect(pal_info).to have_key(:description)

  end
end