class Friendship < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  validates_presence_of :sender_id, require: true
  validates_presence_of :receiver_id, require: true

  scope :active, -> { where('current =?', true) }
  scope :not_active, -> { where('current =?', false) }

  # DONT ALLOW CONNECTION IF ADDRESS NOT VERIFIED FOR BOTH USERS
end
