class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
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
end
