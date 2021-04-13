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

  # def current_pal(params[:id])
  #   pal = Pal.where('user_1 =?', id)
  #   pal_info = User.find(pal.user_2.id)
  # end

  # bottom method works if inverse relationship exists
  def current_pal
    # require 'pry'; binding.pry
    pal = user_1_pals.where(current: true) #finds the pal object
    pal[0].user_2 #returns the user 2 info 
  end
  # need inverse relationship- built it in the seeds or 
  # anytime there is a relationship 

  def self.find_unmatched_user(user_1_id)
    # find a match that isnt me 
    #  find a match who doesnt have a (current: true) match
    #  pluck on user id 
    # then .sample
    # if statement until it finds one 
    # then find user by id since mutation needs id 
    loop do 
      all_users_ids = User.all.pluck(:id)
      sample_id = all_users_ids.sample
      potential_pal = User.find(sample_id) #finds user that sample id belongs to 
    # if user_1_id || current: false
    # end
    # if sample_id == user_1_id || potential_pal.user_1_pals.where(current: true) != []
  
    # require 'pry'; binding.pry
      if sample_id != user_1_id && potential_pal.user_1_pals.where(current: true) == []
        return potential_pal
        # break
      end 
      # return potential_pal
    end 
 
      # return successful connection -- the potential pal 
   
  end

end
