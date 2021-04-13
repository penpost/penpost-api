class Types::FriendshipType < Types::BaseObject 
  field :id, ID, null: false 
  field :user_1_id, Integer, null: false 
  field :user_2_id, Integer, null: false 
  field :current, Boolean, null: true 
endp