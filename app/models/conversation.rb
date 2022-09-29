class Conversation < ApplicationRecord
  has_many :messages, dependent: :destroy, inverse_of: :conversation
  belongs_to :sender, foreign_key: :sender_id, class_name: "User"
  belongs_to :recipient, foreign_key: :recipient_id, class_name: "User"

  validates :sender_id, uniqueness: { scope: :recipient_id }

  def opposed_user(user)
    user == recipient ? sender : recipient
  end

  def self.conversation_exist?(friend_id, user_id)
    Conversation.where(recipient_id: friend_id, sender_id: user_id).or(Conversation.where(recipient_id: user_id, sender_id: friend_id)).exists?
  end

  def self.find_conversation(friend_id, user_id)
    Conversation.where(recipient_id: friend_id, sender_id: user_id).or(Conversation.where(recipient_id: user_id, sender_id: friend_id))
  end
end
