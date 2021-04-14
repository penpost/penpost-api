class Mutations::EditUser < Mutations::BaseMutation
  argument :id, ID, required: true 
  argument :password, String, required: false 
  argument :name, String, required: false 
  argument :email, String, required: false 
  argument :description, String, required: false
  argument :street, String, required: false 
  argument :city, String, required: false 
  argument :state, String, required: false 
  argument :zip, String, required: false 
  argument :country, String, required: false 
  argument :address_verified, Boolean, required: false 

  type Types::UserType

  def resolve(id:, **attributes)
    user = User.find(id)
    require 'pry'; binding.pry
    user.update!(attributes)

    # if (args.name !== nil)
    #   user.update(name: args[:name])
    # end

    # if (args.description !== nil)
    #   user.update(description: args[:description])
    # end

  end
end
