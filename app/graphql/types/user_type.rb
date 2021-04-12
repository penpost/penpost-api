class Types::UserType < Types::BaseObject 

  field :id, ID, null: false 
  field :name, String, null: false 
  field :email, String, null: false 
  field :description, String, null: true
  field :street, String, null: false 
  field :city, String, null: false 
  field :state, String, null: false 
  field :zip, String, null: false 
  field :country, String, null: false 
  field :address_verified, Boolean, null: false 
  # field :pals, Types::PalType.connection_type, nill: false 
  # field :pals, Types::PalType.connection_type, nill: false 

  # def :pals 
  #   object.items 
  # end
end