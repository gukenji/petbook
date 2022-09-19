class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy

  has_many :invitations, foreign_key: :invited_user_id
  has_many :friend_requests, through: :invitations

  mount_uploader :avatar, AvatarUploader
  mount_uploader :cover, AvatarUploader

  def self.search(name)
    user = User.where('name = ?', name) if name
  end
end
