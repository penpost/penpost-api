class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :description
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.boolean :address_verified, default: false

      t.timestamps
    end
  end
end
