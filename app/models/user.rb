class User < ApplicationRecord
  has_many :user_1_pals, class_name: 'Pal', foreign_key: 'user_1'
  has_many :user_2_pals, class_name: 'Pal', foreign_key: 'user_2'

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, require: true
  validates_presence_of :name, require: true
  validates_presence_of :street, require: true
  validates_presence_of :city, require: true
  validates_presence_of :state, require: true
  validates_presence_of :zip, require: true
  validates_presence_of :country, require: true

  has_secure_password

  def current_pal
    
  end
end
