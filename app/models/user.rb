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


  def self.find_unmatched_user(user_1_id)
    users = User.where('id != ?', user_1_id) 
    all_user = users.size
    all_user.times do 
      all_users_ids = users.pluck(:id)
      sample_id = all_users_ids.sample
      potential_pal = User.find(sample_id) 
      if potential_pal.friendships_requested.where(current: true) == [] && potential_pal.friendships_received.where(current: true) == []
        return potential_pal
      end 
    end
  end

end
