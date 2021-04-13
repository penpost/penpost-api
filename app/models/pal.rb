class Pal < ApplicationRecord
  belongs_to :user_1, class_name: 'User'
  belongs_to :user_2, class_name: 'User'

  # validates_presence_of :current 
  validates_presence_of :user_1, require: true
  validates_presence_of :user_2, require: true
  # DONT ALLOW CONNECTION IF ADDRESS NOT VERIFIED FOR BOTH USERS

  def self.create_relationships(user_1, user_2)
    Pal.create(user_1: user_1, user_2: user_2, current: true)
    Pal.create(user_1: user_2, user_2: user_1, current: true)
  end
  #similar to what we had in viewing party(inverse relationship)

end
