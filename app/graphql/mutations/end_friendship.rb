class Mutations::EndFriendship < Mutations::BaseMutation
  argument :id, ID, required: true 

  type Types::FriendshipType

   def resolve(args)
    user1 = User.find(args[:id]) 

    if user1.friendships_requested.where(current: true) != [] 
      friendship = user1.friendships_requested.where(current: true).first

    elsif  user1.friendships_received.where(current: true) != [] 
      friendship = user1.friendships_received.where(current: true).first
    end

    friendship.update(current: false)
    friendship
  end


end