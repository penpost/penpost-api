class Mutations::EndFriendship < Mutations::BaseMutation
  argument :id, ID, required: true 

  type Types::FriendshipType


  def resolve(args)
    user1 = User.find(args[:id]) 
    friendship = user1.friendships_requested.where(current: true).first
    friendship.update(current: false)
    friendship

  end


end