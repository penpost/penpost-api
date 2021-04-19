module Types
  class MutationType < Types::BaseObject
 
    field :create_user, mutation: Mutations::CreateUser
    field :update_user, mutation: Mutations::UpdateUser
    field :random_pal, mutation: Mutations::RandomPal
    field :end_friendship, mutation: Mutations::EndFriendship

  end
end
