module Types
  class MutationType < BaseObject
 
    field :create_user, mutation: Mutations::CreateUser
    field :update_user, mutation: Mutations::UpdateUser
    field :random_pal, mutation: Mutations::RandomPal
    field :end_friendship, mutation: Mutations::EndFriendship
    field :signin_user, mutation: Mutations::SignInUser
  end
end
