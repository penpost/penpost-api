class Mutations::RandomPal < Mutations::BaseMutation
  argument :id, ID, required: true 

  type Types::UserType


  def resolve(args)
    user_1 = User.find(args[:id]) #find user1 by id 
    user_2 = User.find_unmatched_user(user_1.id) #from User model 
    # require 'pry'; binding.pry
    Pal.create_relationships(user_1, user_2) #creating relationship and the inverse relationship in Pal model 

    user_2 
# dream driving- create methods in model to match and create relationships
  end


end