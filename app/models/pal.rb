class Pal < ApplicationRecord
  belongs_to :user_1, class_name: 'User'
  belongs_to :user_2, class_name: 'User'

  validates_presence_of :current, require: true
  validates_presence_of :user_1, require: true
  validates_presence_of :user_2, require: true
  # DONT ALLOW CONNECTION IF ADDRESS NOT VERIFIED FOR BOTH USERS
end
