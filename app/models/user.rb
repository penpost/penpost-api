class User < ApplicationRecord
  has_many :friendships_requested, class_name: 'Friendship', foreign_key: 'sender_id', dependent: :destroy
  has_many :friends, through: :friendships_requested, source: :receiver
  has_many :friendships_received, class_name: 'Friendship', foreign_key: 'receiver_id', dependent: :destroy
  has_many :inverse_friends, through: :friendships_received, source: :sender
  # has_many :friends, through: :friendships, source: :receiver
  # MAKE SURE TO UPDATE PW TO NOT ALLLOW NIL. ONLY SET FOR MVP
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, require: true, allow_nil: true
  validates_presence_of :name, require: true
  validates_presence_of :street, require: true
  validates_presence_of :city, require: true
  validates_presence_of :state, require: true
  validates_presence_of :zip, require: true
  validates_presence_of :country, require: true

  has_secure_password

  def friend_request(other_user)
    friendships_requested.create(receiver_id: other_user.id)
  end

  def pals?(other_user)
    pals.include?(other_user)
  end

  def pals
    self.friends + self.inverse_friends
  end

  def current_pal
    return nil if self.friendships_received.active.empty? && self.friendships_requested.active.empty?

    if self.friendships_received.active.empty?
      x = self.friendships_requested.active.first
      User.find(x.receiver_id)
    else
      x = self.friendships_received.active.first
      User.find(x.sender_id)
    end
  end


  def find_unmatched_user
    User.find do |user|
      user.id != self.id &&
      user.friendships_requested.where(current: true) == [] &&
      user.friendships_received.where(current: true) == []
    end
  end

end
