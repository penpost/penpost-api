class Mutations::RandomPal < Mutations::BaseMutation
  argument :id, ID, required: true 

  type Types::UserType


  def resolve(args)
    user_1 = User.find(args[:id]) 
    user_2 = User.find_unmatched_user(user_1.id)
     if user_2.class == User #if it is the class User then make the fiend connection
      user_1.friend_request(user_2)
     else #user_2.class == Integer <<<< orginally being returned back an integer 
        raise GraphQL::ExecutionError, 
        "All users have friends"
     end 
    user_2 
  end


end