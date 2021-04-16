class User < ApplicationRecord
  has_many :friendships_requested, class_name: 'Friendship', foreign_key: 'sender_id', dependent: :destroy
  has_many :friends, through: :friendships_requested, source: :receiver
  has_many :friendships_received, class_name: 'Friendship', foreign_key: 'receiver_id', dependent: :destroy
  has_many :inverse_friends, through: :friendships_received, source: :sender
  # has_many :friends, through: :friendships, source: :receiver

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, require: true
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
    all_user = User.all.size
    # AE: If we have 10,000 users .times method can slow down our application
    # Rather use SQL or ActiveRecord to speed this up (searching within a DB is faster)
    ## scope :matched, -> { where('current_pal != ?', nil) }
    ## scope :unmatched, -> { where('current_pal = ?', nil) }
    ## potential_pal = User.unmatched.sample.where(id != self.id)
    all_user.times do 
      all_users_ids = User.all.pluck(:id)
      sample_id = all_users_ids.sample
      potential_pal = User.find(sample_id) 
      # rather than check whether the potential pal has recieved or sent friend requests, lets just make sure they have no current pal
      if sample_id != user_1_id && potential_pal.friendships_requested.where(current: true) == [] && potential_pal.friendships_received.where(current: true) == []
        return potential_pal
      end 
    end
  end

end
