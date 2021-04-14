module Types
  class MutationType < Types::BaseObject
 
    field :create_user, mutation: Mutations::CreateUser
    field :random_pal, mutation: Mutations::RandomPal
    field :update_user, mutation: Mutations::UpdateUser

  end
end
