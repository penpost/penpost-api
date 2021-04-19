class Mutations::UpdateUser < Mutations::BaseMutation
  # class AuthProviderSignupData < Types::BaseInputObject
  #   argument :credentials, Types::AuthProviderCredentialsInput, required: false
  # end
  
  argument :id, ID, required: true 
  # argument :password, String, required: false 
  argument :name, String, required: false 
  argument :email, String, required: false 
  argument :description, String, required: false
  argument :street, String, required: false 
  argument :city, String, required: false 
  argument :state, String, required: false 
  argument :zip, String, required: false 
  argument :country, String, required: false 
  argument :address_verified, Boolean, required: false 
  # argument :auth_provider, AuthProviderSignupData, required: false

  type Types::UserType

  def resolve(id:, **args)
    # require 'pry'; binding.pry
    user = User.find(id)
    user.update!(args)
    user
    # if (args.name !== nil)
    #   user.update(name: args[:name])
    # end
    # if (args[:description] != nil)
    #   user.update!(description: args[:description])
    # end
  end
end
