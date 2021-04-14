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
  field :active_pal, Types::UserType, null: true 
  # field :active_pal, Types::UserConnectionPage, null: false 
  # field :pals, Types::PalType.connection_type, null: false 

  def active_pal 
    object.current_pal
  end
end