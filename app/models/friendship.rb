class Friendship < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  validates_presence_of :sender_id, require: true
  validates_presence_of :receiver_id, require: true

  scope :active, -> { where('current =?', true) }
  scope :not_active, -> { where('current =?', false) }

  # DONT ALLOW CONNECTION IF ADDRESS NOT VERIFIED FOR BOTH USERS

  # def self.create_relationships(user_1, user_2)
  #   Pal.create(user_1: user_1, user_2: user_2, current: true)
  #   Pal.create(user_1: user_2, user_2: user_1, current: true)
  # end
  #similar to what we had in viewing party(inverse relationship)

end
