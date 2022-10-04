class User < ApplicationRecord
  require 'pry'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]
  has_many :posts, dependent: :destroy

  has_many :invitations, foreign_key: :invited_user_id
  has_many :friend_requests, through: :invitations

  has_many :friends, foreign_key: :user_id


  mount_uploader :avatar, AvatarUploader

  mount_uploader :cover, AvatarUploader

  has_many :likes

  has_many :messages
  has_many :conversations, foreign_key: :sender_id
  
  def self.search(name)
    user = User.where('name = ?', name) if name
  end

  def self.searchfriends(id)
    friends = Friend.where('user_id = ? or friend_id = ?', id, id)
  end


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name   # assuming the user model has a name
      user.uploaded_url = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      #user.skip_confirmation!
    end
  end
end
