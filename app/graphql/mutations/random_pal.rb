class Mutations::RandomPal < Mutations::BaseMutation
  argument :id, ID, required: true 

  type Types::UserType


  def resolve(args)
    user_1 = User.find(args[:id]) 
    user_2 = User.find_unmatched_user(user_1.id)
     if user_2.class == User 
      user_1.friend_request(user_2)
     else 
        raise GraphQL::ExecutionError, 
        "All users have current friends"
     end 
    user_2 
  end


end